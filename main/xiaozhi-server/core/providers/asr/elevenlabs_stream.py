import re
import json
import time
import base64
import asyncio
import websockets
from urllib.parse import urlencode
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from core.connection import ConnectionHandler

from config.logger import setup_logging
from core.utils import i18n
from core.utils.util import check_model_key
from core.providers.asr.base import ASRProviderBase
from core.providers.asr.dto.dto import InterfaceType

TAG = __name__
logger = setup_logging()

DEFAULT_WS_URL = "wss://api.elevenlabs.io/v1/speech-to-text/realtime"
DEFAULT_MODEL = "scribe_v2_realtime"
SAMPLE_RATE = 16000
# 服务端语种 -> 识别语种（ISO-639-1）
ASR_LANGUAGE_BY_SERVER_LANGUAGE = {"vi": "vi"}
CJK_PATTERN = re.compile(r"[぀-ヿ㐀-䶿一-鿿]")
# 手动提交时没有当前音频帧，用一小段静音作为提交块（60ms，16kHz 16bit）
COMMIT_SILENCE = b"\x00" * 1920
ERROR_MESSAGE_TYPES = {
    "error",
    "auth_error",
    "quota_exceeded",
    "commit_throttled",
    "rate_limited",
    "queue_overflow",
    "session_time_limit_exceeded",
    "chunk_size_exceeded",
    "insufficient_audio_activity",
}
# 出错后暂停重连的时长（秒），避免每个音频帧都重新建连
RETRY_DELAY_FATAL = 30.0  # 认证失败、额度用尽
RETRY_DELAY_DEFAULT = 3.0
FATAL_ERROR_TYPES = {"auth_error", "quota_exceeded"}


class ASRProvider(ASRProviderBase):
    """ElevenLabs Scribe 实时语音识别（WebSocket）

    使用 commit_strategy=manual，由服务端本地VAD（或设备 listen stop）决定何时提交，
    提交后等待 committed_transcript 作为最终识别结果。
    """

    def __init__(self, config, delete_audio_file):
        super().__init__()
        self.interface_type = InterfaceType.STREAM
        self.config = config
        self.api_key = config.get("api_key")
        self.ws_url = config.get("ws_url") or DEFAULT_WS_URL
        self.model = config.get("model_name") or DEFAULT_MODEL
        # 识别语种：未配置时按服务端语种选择，显式填空则自动检测
        if "language" in config:
            self.language = str(config.get("language") or "").strip()
        else:
            self.language = ASR_LANGUAGE_BY_SERVER_LANGUAGE.get(i18n.get_language(config), "")
        keyterms = config.get("keyterms") or ""
        if isinstance(keyterms, str):
            keyterms = keyterms.split(",")
        self.keyterms = [k.strip() for k in keyterms if str(k).strip()]
        self.commit_timeout = float(config.get("commit_timeout") or 5)
        self.output_dir = config.get("output_dir", "tmp/")
        self.delete_audio_file = delete_audio_file

        self.text = ""
        self.asr_ws = None
        self.forward_task = None
        self.is_processing = False
        self.server_ready = False
        self.committing = False
        self.commit_time = 0.0
        self.sent_frames = 0
        self.retry_after = 0.0

        model_key_msg = check_model_key("ASR", self.api_key)
        if model_key_msg:
            logger.bind(tag=TAG).error(model_key_msg)

    def _build_url(self):
        params = [
            ("model_id", self.model),
            ("audio_format", f"pcm_{SAMPLE_RATE}"),
            ("commit_strategy", "manual"),
        ]
        if self.language:
            params.append(("language_code", self.language))
        for term in self.keyterms:
            params.append(("keyterms", term))
        return f"{self.ws_url}?{urlencode(params)}"

    async def open_audio_channels(self, conn):
        await super().open_audio_channels(conn)

    async def receive_audio(self, conn: "ConnectionHandler", pcm_frame, audio_have_voice):
        # 父类负责缓存音频（conn.asr_audio）
        await super().receive_audio(conn, pcm_frame, audio_have_voice)

        # 有声音且未建立连接时开始识别会话
        if (
            audio_have_voice
            and not self.is_processing
            and not self.asr_ws
            and time.monotonic() >= self.retry_after
        ):
            try:
                await self._start_recognition(conn)
            except Exception as e:
                logger.bind(tag=TAG).error(f"Failed to start recognition: {e}")
                self.retry_after = time.monotonic() + RETRY_DELAY_DEFAULT
                await self._cleanup()
                return

        if not (self.asr_ws and self.server_ready) or self.committing:
            return

        # 自动模式下本地VAD判断说话结束：连同当前帧一起提交
        commit = conn.client_listen_mode != "manual" and conn.client_voice_stop
        try:
            await self._send_chunk(pcm_frame, commit=commit)
            self.sent_frames += 1
            if commit:
                self._mark_committing()
        except Exception as e:
            logger.bind(tag=TAG).warning(f"Failed to send audio: {e}")
            await self._cleanup()

    async def _send_chunk(self, pcm_bytes: bytes, commit: bool = False):
        message = {
            "message_type": "input_audio_chunk",
            "audio_base_64": base64.b64encode(pcm_bytes).decode("ascii"),
            "commit": commit,
            "sample_rate": SAMPLE_RATE,
        }
        await self.asr_ws.send(json.dumps(message))

    def _mark_committing(self):
        self.committing = True
        self.commit_time = time.monotonic()
        logger.bind(tag=TAG).debug("Audio committed, waiting for final transcript")

    async def _start_recognition(self, conn: "ConnectionHandler"):
        """建立WebSocket连接并启动结果监听"""
        self.is_processing = True
        self.server_ready = False
        self.committing = False
        self.sent_frames = 0
        self.text = ""
        try:
            self.asr_ws = await websockets.connect(
                self._build_url(),
                additional_headers={"xi-api-key": self.api_key},
                max_size=10_000_000,
                ping_interval=None,
                ping_timeout=None,
                close_timeout=5,
            )
            logger.bind(tag=TAG).debug("ElevenLabs realtime ASR connected")
            self.forward_task = asyncio.create_task(self._forward_results(conn))
        except Exception:
            if self.asr_ws:
                await self.asr_ws.close()
                self.asr_ws = None
            self.is_processing = False
            raise

    async def _flush_buffered_audio(self, conn: "ConnectionHandler"):
        """会话就绪后补发连接期间缓存的音频（含语音开始前的少量静音）"""
        while self.sent_frames < len(conn.asr_audio):
            await self._send_chunk(conn.asr_audio[self.sent_frames])
            self.sent_frames += 1
        # 循环结束与置位之间没有await，不会漏掉新到的音频帧
        self.server_ready = True

    async def _forward_results(self, conn: "ConnectionHandler"):
        """接收识别结果，收到最终结果后触发对话"""
        try:
            while not conn.stop_event.is_set():
                if self.committing and time.monotonic() - self.commit_time > self.commit_timeout:
                    logger.bind(tag=TAG).warning("Timed out waiting for final transcript")
                    break
                try:
                    response = await asyncio.wait_for(self.asr_ws.recv(), timeout=1.0)
                except asyncio.TimeoutError:
                    continue

                result = json.loads(response)
                message_type = result.get("message_type", "")

                if message_type == "session_started":
                    await self._flush_buffered_audio(conn)
                    # 连接期间设备已结束说话（自动模式VAD或手动stop）时立即提交
                    if conn.client_voice_stop and not self.committing:
                        await self._send_chunk(COMMIT_SILENCE, commit=True)
                        self._mark_committing()
                elif message_type == "partial_transcript":
                    logger.bind(tag=TAG).debug(f"Partial transcript: {result.get('text', '')}")
                elif message_type.startswith("committed_transcript"):
                    text = (result.get("text") or "").strip()
                    if self.language == "vi" and CJK_PATTERN.search(text):
                        logger.bind(tag=TAG).warning(
                            f"Result contains Chinese characters, treating as unrecognized: {text}"
                        )
                        text = ""
                    self.text = text
                    await self.handle_voice_stop(conn, conn.asr_audio.copy())
                    break
                elif message_type in ERROR_MESSAGE_TYPES:
                    detail = result.get("error") or result.get("message") or result
                    if message_type == "insufficient_audio_activity":
                        logger.bind(tag=TAG).info(f"No speech detected: {detail}")
                    else:
                        logger.bind(tag=TAG).error(f"ElevenLabs realtime ASR error ({message_type}): {detail}")
                        delay = (
                            RETRY_DELAY_FATAL
                            if message_type in FATAL_ERROR_TYPES
                            else RETRY_DELAY_DEFAULT
                        )
                        self.retry_after = time.monotonic() + delay
                    if self.committing or message_type != "insufficient_audio_activity":
                        break

        except websockets.ConnectionClosed as e:
            logger.bind(tag=TAG).info(f"ASR service connection closed: {e}")
        except Exception as e:
            logger.bind(tag=TAG).error(f"Failed to process ASR result: {e}")
        finally:
            await self._cleanup()
            conn.reset_audio_states()

    async def _send_stop_request(self):
        """设备手动模式发送 listen stop 时提交音频"""
        if self.asr_ws and self.server_ready and not self.committing:
            try:
                await self._send_chunk(COMMIT_SILENCE, commit=True)
                self._mark_committing()
            except Exception as e:
                logger.bind(tag=TAG).error(f"Failed to send stop request: {e}")
                await self._cleanup()
        # 未就绪时由 session_started 分支根据 client_voice_stop 提交

    async def _cleanup(self):
        """关闭连接并重置状态"""
        self.is_processing = False
        self.server_ready = False
        self.committing = False
        self.sent_frames = 0
        ws, self.asr_ws = self.asr_ws, None
        if ws:
            try:
                await asyncio.wait_for(ws.close(), timeout=2.0)
            except Exception as e:
                logger.bind(tag=TAG).debug(f"Failed to close WebSocket connection: {e}")
        self.forward_task = None

    async def speech_to_text(self, opus_data, session_id, artifacts=None):
        """返回最终识别结果"""
        result = self.text
        self.text = ""
        return result, None

    async def close(self):
        await self._cleanup()

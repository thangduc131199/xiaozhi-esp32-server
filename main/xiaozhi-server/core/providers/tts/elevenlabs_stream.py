import os
import time
import queue
import asyncio
import aiohttp
import requests
import traceback

from core.utils import textUtils
from config.logger import setup_logging
from core.utils.util import check_model_key
from core.providers.tts.base import TTSProviderBase
from core.providers.tts.dto.dto import SentenceType, ContentType
from core.utils.tts import MarkdownCleaner, convert_percentage_to_range


TAG = __name__
logger = setup_logging()

DEFAULT_BASE_URL = "https://api.elevenlabs.io"
DEFAULT_VOICE_ID = "EXAVITQu4vr4xnSDxMaL"
# eleven_flash_v2_5 支持越南语且延迟最低
DEFAULT_MODEL_ID = "eleven_flash_v2_5"
SUPPORTED_PCM_RATES = (8000, 16000, 22050, 24000, 44100, 48000)
FALLBACK_PCM_RATE = 16000


def _optional_float(value):
    """配置为空字符串时返回None，由ElevenLabs使用默认值"""
    if value is None or str(value).strip() == "":
        return None
    return float(value)


class TTSProvider(TTSProviderBase):
    """ElevenLabs 流式语音合成，直接获取PCM音频并编码为opus"""

    def __init__(self, config, delete_audio_file):
        super().__init__(config, delete_audio_file)
        self.api_key = config.get("api_key")
        self.voice_id = config.get("private_voice") or config.get("voice_id") or DEFAULT_VOICE_ID
        self.model_id = config.get("model_id") or DEFAULT_MODEL_ID
        self.language_code = str(config.get("language_code") or "").strip()
        self.base_url = (config.get("base_url") or DEFAULT_BASE_URL).rstrip("/")

        self.voice_settings = {}
        for key in ("stability", "similarity_boost", "style", "speed"):
            value = _optional_float(config.get(key))
            if value is not None:
                self.voice_settings[key] = value
        # 智控台的语速百分比，ElevenLabs speed 取值范围 0.7 ~ 1.2
        if "ttsRate" in config:
            self.voice_settings["speed"] = round(
                convert_percentage_to_range(
                    config["ttsRate"], min_val=0.7, max_val=1.2, base_val=1.0
                ),
                2,
            )

        self.header = {
            "Content-Type": "application/json",
            "xi-api-key": self.api_key,
        }
        self.pcm_rate = FALLBACK_PCM_RATE
        self.audio_file_type = "pcm"
        self.pcm_buffer = bytearray()

        model_key_msg = check_model_key("TTS", self.api_key)
        if model_key_msg:
            logger.bind(tag=TAG).error(model_key_msg)

    async def open_audio_channels(self, conn):
        """初始化音频通道，按设备采样率选择ElevenLabs的PCM输出格式"""
        await super().open_audio_channels(conn)
        self.pcm_rate = self._select_pcm_rate(conn.sample_rate)

    @staticmethod
    def _select_pcm_rate(sample_rate):
        if sample_rate in SUPPORTED_PCM_RATES:
            return sample_rate
        logger.bind(tag=TAG).warning(
            f"ElevenLabs does not support PCM sample rate {sample_rate}, using {FALLBACK_PCM_RATE}"
        )
        return FALLBACK_PCM_RATE

    def _build_payload(self, text):
        payload = {"text": text, "model_id": self.model_id}
        if self.language_code:
            payload["language_code"] = self.language_code
        if self.voice_settings:
            payload["voice_settings"] = self.voice_settings
        return payload

    def _build_url(self, stream=True):
        suffix = "/stream" if stream else ""
        return (
            f"{self.base_url}/v1/text-to-speech/{self.voice_id}{suffix}"
            f"?output_format=pcm_{self.pcm_rate}"
        )

    def _frame_bytes(self):
        # 16-bit PCM，每个采样2字节
        return int(
            self.opus_encoder.sample_rate
            * self.opus_encoder.channels
            * self.opus_encoder.frame_size_ms
            / 1000
            * 2
        )

    def tts_text_priority_thread(self):
        """流式文本处理线程"""
        while not self.conn.stop_event.is_set():
            try:
                message = self.tts_text_queue.get(timeout=1)
                if message.sentence_type == SentenceType.FIRST:
                    # 初始化参数
                    self.tts_stop_request = False
                    self.processed_chars = 0
                    self.tts_text_buff = []
                    self.before_stop_play_files.clear()
                elif ContentType.TEXT == message.content_type:
                    self.tts_text_buff.append(message.content_detail)
                    segment_text = self._get_segment_text()
                    if segment_text:
                        self.to_tts_single_stream(segment_text)

                elif ContentType.FILE == message.content_type:
                    logger.bind(tag=TAG).info(
                        f"Adding audio file to playback list: {message.content_file}"
                    )
                    if message.content_file and os.path.exists(message.content_file):
                        self._process_audio_file_stream(
                            message.content_file,
                            callback=lambda audio_data: self.handle_audio_file(
                                audio_data, message.content_detail
                            ),
                        )
                if message.sentence_type == SentenceType.LAST:
                    # 处理剩余的文本
                    self._process_remaining_text_stream(True)

            except queue.Empty:
                continue
            except Exception as e:
                logger.bind(tag=TAG).error(
                    f"Failed to process TTS text: {str(e)}, type: {type(e).__name__}, stack: {traceback.format_exc()}"
                )

    def _process_remaining_text_stream(self, is_last=False):
        """处理剩余的文本并生成语音"""
        full_text = "".join(self.tts_text_buff)
        remaining_text = full_text[self.processed_chars :]
        if remaining_text:
            segment_text = textUtils.get_string_no_punctuation_or_emoji(remaining_text)
            if segment_text:
                self.to_tts_single_stream(segment_text, is_last)
                self.processed_chars += len(full_text)
            else:
                self._process_before_stop_play_files()
        else:
            self._process_before_stop_play_files()

    def to_tts_single_stream(self, text, is_last=False):
        try:
            original_text = text
            text = MarkdownCleaner.clean_markdown(text)
            if self._correct_words_pattern:
                text = self._correct_words_pattern.sub(
                    lambda m: self.correct_words[m.group(0)], text
                )
            success = asyncio.run(self.text_to_speak(text, is_last))
            if success:
                logger.bind(tag=TAG).info(f"Speech generated: {original_text}")
            else:
                logger.bind(tag=TAG).error(f"Speech generation failed: {original_text}")
        except Exception as e:
            logger.bind(tag=TAG).error(f"Failed to generate TTS audio: {e}")
        return None

    async def text_to_speak(self, text, is_last):
        """流式获取PCM并编码为opus，每句只推送一次音频列表；返回是否收到音频"""
        frame_bytes = self._frame_bytes()
        received_audio = False
        try:
            async with aiohttp.ClientSession() as session:
                async with session.post(
                    self._build_url(stream=True),
                    headers=self.header,
                    json=self._build_payload(text),
                    timeout=aiohttp.ClientTimeout(total=self.tts_timeout),
                ) as resp:
                    if resp.status != 200:
                        logger.bind(tag=TAG).error(
                            f"TTS request failed: {resp.status}, {(await resp.text())[:300]}"
                        )
                        self.tts_audio_queue.put((SentenceType.LAST, [], None))
                        return False

                    self.pcm_buffer.clear()
                    self.tts_audio_queue.put((SentenceType.FIRST, [], text))

                    async for chunk in resp.content.iter_any():
                        if not chunk:
                            continue
                        received_audio = True
                        self.pcm_buffer.extend(chunk)
                        while len(self.pcm_buffer) >= frame_bytes:
                            frame = bytes(self.pcm_buffer[:frame_bytes])
                            del self.pcm_buffer[:frame_bytes]
                            self.opus_encoder.encode_pcm_to_opus_stream(
                                frame, end_of_stream=False, callback=self.handle_opus
                            )

                    if not received_audio:
                        logger.bind(tag=TAG).error("TTS returned no audio data")
                        self.tts_audio_queue.put((SentenceType.LAST, [], None))
                        return False

                    # flush 剩余不足一帧的数据（丢弃不完整的16-bit采样）
                    if len(self.pcm_buffer) % 2:
                        del self.pcm_buffer[-1:]
                    if self.pcm_buffer:
                        self.opus_encoder.encode_pcm_to_opus_stream(
                            bytes(self.pcm_buffer),
                            end_of_stream=True,
                            callback=self.handle_opus,
                        )
                        self.pcm_buffer.clear()

                    if is_last:
                        self._process_before_stop_play_files()
                    return True

        except Exception as e:
            logger.bind(tag=TAG).error(f"TTS request error: {e}")
            self.tts_audio_queue.put((SentenceType.LAST, [], None))
            return False

    async def close(self):
        """资源清理"""
        await super().close()
        if hasattr(self, "opus_encoder"):
            self.opus_encoder.close()

    def to_tts(self, text: str) -> list:
        """非流式TTS处理，用于测试及保存音频文件的场景，返回opus数据列表"""
        start_time = time.time()
        text = MarkdownCleaner.clean_markdown(text)
        if self._correct_words_pattern:
            text = self._correct_words_pattern.sub(
                lambda m: self.correct_words[m.group(0)], text
            )
        try:
            response = requests.post(
                self._build_url(stream=False),
                json=self._build_payload(text),
                headers=self.header,
                timeout=self.tts_timeout,
            )
            if response.status_code != 200:
                logger.bind(tag=TAG).error(
                    f"TTS request failed: {response.status_code}, {response.text[:300]}"
                )
                return []
            logger.bind(tag=TAG).info(
                f"TTS request succeeded: {text}, took: {time.time() - start_time}s"
            )

            pcm_data = response.content
            if len(pcm_data) % 2:
                pcm_data = pcm_data[:-1]
            frame_bytes = self._frame_bytes()
            opus_datas = []
            for i in range(0, len(pcm_data), frame_bytes):
                frame = bytes(pcm_data[i : i + frame_bytes])
                if len(frame) < frame_bytes:
                    frame += b"\x00" * (frame_bytes - len(frame))
                self.opus_encoder.encode_pcm_to_opus_stream(
                    frame,
                    end_of_stream=(i + frame_bytes >= len(pcm_data)),
                    callback=lambda opus: opus_datas.append(opus),
                )
            return opus_datas
        except Exception as e:
            logger.bind(tag=TAG).error(f"TTS request error: {e}")
            return []

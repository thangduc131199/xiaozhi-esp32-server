import time
import os
import re
from config.logger import setup_logging
from typing import Optional, Tuple, List
from core.utils import i18n
from core.utils.util import check_model_key
from core.providers.asr.dto.dto import InterfaceType
from core.providers.asr.base import ASRProviderBase

import requests

TAG = __name__
logger = setup_logging()

DEFAULT_BASE_URL = "https://api.elevenlabs.io/v1/speech-to-text"
DEFAULT_MODEL = "scribe_v2"
# 服务端语种 -> 识别语种（ISO-639-1）
ASR_LANGUAGE_BY_SERVER_LANGUAGE = {"vi": "vi"}
CJK_PATTERN = re.compile(r"[぀-ヿ㐀-䶿一-鿿]")
REQUEST_TIMEOUT = 15


class ASRProvider(ASRProviderBase):
    """ElevenLabs Speech-to-Text（Scribe）语音识别"""

    def __init__(self, config: dict, delete_audio_file: bool):
        self.interface_type = InterfaceType.NON_STREAM
        self.api_key = config.get("api_key")
        self.api_url = config.get("base_url") or DEFAULT_BASE_URL
        self.model = config.get("model_name") or DEFAULT_MODEL
        # 识别语种：未配置时按服务端语种选择，显式填空则自动检测
        if "language" in config:
            self.language = str(config.get("language") or "").strip()
        else:
            self.language = ASR_LANGUAGE_BY_SERVER_LANGUAGE.get(i18n.get_language(config), "")
        # 优先识别的关键词，逗号分隔（ElevenLabs 对该功能额外计费）
        keyterms = config.get("keyterms") or ""
        if isinstance(keyterms, str):
            keyterms = keyterms.split(",")
        self.keyterms = [k.strip() for k in keyterms if str(k).strip()]
        self.output_dir = config.get("output_dir") or "tmp/"
        self.delete_audio_file = delete_audio_file

        model_key_msg = check_model_key("ASR", self.api_key)
        if model_key_msg:
            logger.bind(tag=TAG).error(model_key_msg)

        os.makedirs(self.output_dir, exist_ok=True)

    def requires_file(self) -> bool:
        return True

    def _transcribe(self, file_path: str) -> str:
        """调用识别接口，返回识别文本"""
        headers = {"xi-api-key": self.api_key}
        # 同名字段 keyterms 可重复出现，因此使用元组列表
        data = [("model_id", self.model), ("tag_audio_events", "false")]
        if self.language:
            data.append(("language_code", self.language))
        for term in self.keyterms:
            data.append(("keyterms", term))

        with open(file_path, "rb") as audio_file:
            start_time = time.time()
            response = requests.post(
                self.api_url,
                files={"file": (os.path.basename(file_path), audio_file, "audio/wav")},
                data=data,
                headers=headers,
                timeout=REQUEST_TIMEOUT,
            )
            logger.bind(tag=TAG).debug(
                f"ElevenLabs ASR took: {time.time() - start_time:.3f}s | result: {response.text}"
            )

        if response.status_code != 200:
            raise Exception(f"API request failed: {response.status_code} - {response.text}")
        return (response.json().get("text") or "").strip()

    async def speech_to_text(self, opus_data: List[bytes], session_id: str, artifacts=None) -> Tuple[Optional[str], Optional[str]]:
        file_path = None
        try:
            if artifacts is None:
                return "", None
            file_path = artifacts.file_path

            logger.bind(tag=TAG).info(f"file path: {file_path}")
            text = self._transcribe(file_path)

            # 越南语结果中出现汉字视为误识别
            if self.language == "vi" and CJK_PATTERN.search(text):
                logger.bind(tag=TAG).warning(f"Result contains Chinese characters, treating as unrecognized: {text}")
                text = ""

            return text, file_path

        except Exception as e:
            logger.bind(tag=TAG).error(f"Speech recognition failed: {e}")
            return "", None

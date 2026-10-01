import time
import os
import re
from config.logger import setup_logging
from typing import Optional, Tuple, List
from core.utils import i18n
from core.providers.asr.dto.dto import InterfaceType
from core.providers.asr.base import ASRProviderBase

import requests

TAG = __name__
logger = setup_logging()

# 服务端语种 -> 识别语种（ISO-639-1）
ASR_LANGUAGE_BY_SERVER_LANGUAGE = {"vi": "vi"}
CJK_PATTERN = re.compile(r"[぀-ヿ㐀-䶿一-鿿]")
REQUEST_TIMEOUT = 15


class ASRProvider(ASRProviderBase):
    def __init__(self, config: dict, delete_audio_file: bool):
        self.interface_type = InterfaceType.NON_STREAM
        self.api_key = config.get("api_key")
        self.api_url = config.get("base_url")
        self.model = config.get("model_name")
        # 识别语种（ISO-639-1，如 vi、zh、en）：未配置时按服务端语种选择，显式填空则自动检测
        if "language" in config:
            self.language = str(config.get("language") or "").strip()
        else:
            self.language = ASR_LANGUAGE_BY_SERVER_LANGUAGE.get(i18n.get_language(config), "")
        # 上下文提示词：可提示常用词汇及拼写，未配置时使用对应语种的默认提示
        self.prompt = str(config.get("prompt") or "").strip()
        self.strict_prompt = ""
        if self.language == "vi":
            vi_config = {"default_language": "vi"}
            if not self.prompt:
                self.prompt = i18n.t(vi_config, "asr_context_prompt")
            self.strict_prompt = f"{i18n.t(vi_config, 'asr_strict_prompt')} {self.prompt}".strip()
        self.output_dir = config.get("output_dir")
        self.delete_audio_file = delete_audio_file

        os.makedirs(self.output_dir, exist_ok=True)

    def requires_file(self) -> bool:
        return True

    def _transcribe(self, file_path: str, prompt: str) -> str:
        """调用识别接口，返回识别文本"""
        headers = {
            "Authorization": f"Bearer {self.api_key}",
        }

        # 使用data参数传递模型名称
        data = {
            "model": self.model
        }
        if self.language:
            data["language"] = self.language
            data["temperature"] = "0"
        if prompt:
            data["prompt"] = prompt

        with open(file_path, "rb") as audio_file:  # 使用with语句确保文件关闭
            files = {
                "file": audio_file
            }

            start_time = time.time()
            response = requests.post(
                self.api_url,
                files=files,
                data=data,
                headers=headers,
                timeout=REQUEST_TIMEOUT,
            )
            logger.bind(tag=TAG).debug(
                f"Speech recognition took: {time.time() - start_time:.3f}s | result: {response.text}"
            )

        if response.status_code != 200:
            raise Exception(f"API request failed: {response.status_code} - {response.text}")
        return response.json().get("text", "")

    async def speech_to_text(self, opus_data: List[bytes], session_id: str, artifacts=None) -> Tuple[Optional[str], Optional[str]]:
        file_path = None
        try:
            if artifacts is None:
                return "", None
            file_path = artifacts.file_path

            logger.bind(tag=TAG).info(f"file path: {file_path}")
            text = self._transcribe(file_path, self.prompt)

            # 越南语短句偶尔被识别成汉字（如“đi thẳng”→“立堂”），用更严格的提示重试一次
            if self.language == "vi" and CJK_PATTERN.search(text):
                logger.bind(tag=TAG).warning(f"Result contains Chinese characters, retrying with strict prompt: {text}")
                text = self._transcribe(file_path, self.strict_prompt)
                if CJK_PATTERN.search(text):
                    logger.bind(tag=TAG).warning(f"Still contains Chinese characters after retry, treating as unrecognized: {text}")
                    text = ""

            return text, file_path

        except Exception as e:
            logger.bind(tag=TAG).error(f"Speech recognition failed: {e}")
            return "", None

"""使用EdgeTTS生成指定语种的内置提示音

用法（在 main/xiaozhi-server 目录下运行，需要 ffmpeg）：
    python scripts/gen_assets.py --lang vi --voice vi-VN-HoaiMyNeural

输出到 config/assets/<lang>/，服务端按 default_language 自动选用，缺失的文件回退到 config/assets/ 下的默认文件。
"""

import os
import sys
import asyncio
import argparse
import tempfile
import subprocess

import edge_tts

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from core.utils import i18n  # noqa: E402

# 绑定码数字读音（仅播放单个数字）
DIGITS = {
    "vi": ["không", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín"],
}

# 绑定码提示音（后面紧接着逐个播放6位数字）
BIND_CODE_INTRO = {
    "vi": "Vui lòng đăng nhập bảng điều khiển và nhập mã",
}


async def synthesize(text: str, voice: str, out_path: str):
    with tempfile.NamedTemporaryFile(suffix=".mp3", delete=False) as tmp:
        mp3_path = tmp.name
    try:
        await edge_tts.Communicate(text, voice).save(mp3_path)
        os.makedirs(os.path.dirname(out_path), exist_ok=True)
        subprocess.run(
            ["ffmpeg", "-y", "-loglevel", "error", "-i", mp3_path,
             "-ar", "24000", "-ac", "1", "-sample_fmt", "s16", out_path],
            check=True,
        )
        print(f"{out_path}: {text}")
    finally:
        os.remove(mp3_path)


async def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--lang", default="vi")
    parser.add_argument("--voice", default="vi-VN-HoaiMyNeural")
    args = parser.parse_args()

    if args.lang not in DIGITS:
        raise SystemExit(f"不支持的语种: {args.lang}")

    config = {"default_language": args.lang}
    out_dir = os.path.join(i18n.ASSETS_DIR, args.lang)
    items = {
        "wakeup_words_short.wav": i18n.t(config, "wakeup_default"),
        "max_output_size.wav": i18n.t(config, "max_output_size"),
        "bind_not_found.wav": i18n.t(config, "bind_not_found"),
        "bind_code.wav": BIND_CODE_INTRO[args.lang],
    }
    for digit, word in enumerate(DIGITS[args.lang]):
        items[f"bind_code/{digit}.wav"] = word

    for name, text in items.items():
        await synthesize(text, args.voice, os.path.join(out_dir, name))


if __name__ == "__main__":
    asyncio.run(main())

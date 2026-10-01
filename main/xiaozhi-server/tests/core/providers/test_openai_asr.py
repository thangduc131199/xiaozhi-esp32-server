"""Tests for the OpenAI-compatible ASR provider (Vietnamese language forcing and CJK retry)."""
import asyncio
from types import SimpleNamespace

import pytest

from core.providers.asr import openai as openai_asr
from core.providers.asr.openai import ASRProvider


class FakeResponse:
    def __init__(self, text):
        self.status_code = 200
        self._text = text
        self.text = text

    def json(self):
        return {"text": self._text}


@pytest.fixture
def audio_file(tmp_path):
    path = tmp_path / "audio.wav"
    path.write_bytes(b"RIFF")
    return str(path)


def make_asr(tmp_path, **overrides):
    config = {
        "type": "openai",
        "api_key": "test-key",
        "base_url": "https://api.openai.com/v1/audio/transcriptions",
        "model_name": "gpt-4o-mini-transcribe",
        "output_dir": str(tmp_path),
        **overrides,
    }
    return ASRProvider(config, delete_audio_file=True)


def run(asr, audio_file, monkeypatch, texts):
    calls = []
    replies = iter(texts)

    def fake_post(url, files=None, data=None, headers=None, timeout=None):
        calls.append(dict(data))
        return FakeResponse(next(replies))

    monkeypatch.setattr(openai_asr.requests, "post", fake_post)
    text, _ = asyncio.run(asr.speech_to_text([], "s", SimpleNamespace(file_path=audio_file)))
    return text, calls


def test_vietnamese_defaults(tmp_path, audio_file, monkeypatch):
    asr = make_asr(tmp_path, default_language="vi")
    text, calls = run(asr, audio_file, monkeypatch, ["đi thẳng"])
    assert text == "đi thẳng"
    assert len(calls) == 1
    assert calls[0]["language"] == "vi"
    assert calls[0]["temperature"] == "0"
    assert "đi thẳng" in calls[0]["prompt"]


def test_retry_with_strict_prompt_when_cjk(tmp_path, audio_file, monkeypatch):
    asr = make_asr(tmp_path, default_language="vi")
    text, calls = run(asr, audio_file, monkeypatch, ["立堂", "đi thẳng"])
    assert text == "đi thẳng"
    assert len(calls) == 2
    assert "không dùng chữ Hán" in calls[1]["prompt"]


def test_drop_result_when_still_cjk(tmp_path, audio_file, monkeypatch):
    asr = make_asr(tmp_path, default_language="vi")
    text, calls = run(asr, audio_file, monkeypatch, ["立堂", "你係咪?"])
    assert text == ""
    assert len(calls) == 2


def test_chinese_server_language_does_not_force(tmp_path, audio_file, monkeypatch):
    asr = make_asr(tmp_path, default_language="zh")
    text, calls = run(asr, audio_file, monkeypatch, ["你好"])
    assert text == "你好"
    assert "language" not in calls[0]
    assert "prompt" not in calls[0]


def test_explicit_empty_language_disables_forcing(tmp_path, audio_file, monkeypatch):
    asr = make_asr(tmp_path, default_language="vi", language="")
    _, calls = run(asr, audio_file, monkeypatch, ["hello"])
    assert "language" not in calls[0]


def test_custom_prompt(tmp_path, audio_file, monkeypatch):
    asr = make_asr(tmp_path, language="vi", prompt="Lệnh robot: tiến, lùi.")
    _, calls = run(asr, audio_file, monkeypatch, ["tiến"])
    assert calls[0]["prompt"] == "Lệnh robot: tiến, lùi."

"""Tests for the MiniMax streaming TTS provider configuration and error parsing."""
from core.providers.tts import minimax_httpstream
from core.providers.tts.minimax_httpstream import TTSProvider, parse_error_response

BASE_CONFIG = {
    "type": "minimax_httpstream",
    "api_key": "test-key",
    "model": "speech-02-turbo",
    "voice_id": "Vietnamese_kindhearted_girl",
    "output_dir": "tmp/",
}


def make_provider(**overrides):
    return TTSProvider({**BASE_CONFIG, **overrides}, delete_audio_file=True)


def test_defaults_to_international_host_without_group_id():
    provider = make_provider()
    assert provider.api_url == "https://api.minimax.io/v1/t2a_v2"


def test_custom_host_and_group_id():
    provider = make_provider(api_host="api.minimaxi.com", group_id="123")
    assert provider.api_url == "https://api.minimaxi.com/v1/t2a_v2?GroupId=123"


def test_language_boost_from_voice_language():
    payload = make_provider(language="Tiếng Việt")._build_payload("Xin chào")
    assert payload["language_boost"] == "Vietnamese"


def test_explicit_language_boost_wins():
    payload = make_provider(language="Tiếng Việt", language_boost="auto")._build_payload("Xin chào")
    assert payload["language_boost"] == "auto"


def test_no_pronunciation_dict_by_default():
    payload = make_provider()._build_payload("Xin chào")
    assert "pronunciation_dict" not in payload
    assert "language_boost" not in payload


def test_parse_error_response_detects_json_error():
    body = b'{"base_resp":{"status_code":2049,"status_msg":"invalid api key"}}'
    assert parse_error_response(body) == (2049, "invalid api key")


def test_parse_error_response_ignores_sse_and_success():
    assert parse_error_response(b'data: {"data":{"status":1,"audio":"00"}}\n\n') is None
    assert parse_error_response(b'{"base_resp":{"status_code":0,"status_msg":"success"}}') is None


def test_module_default_host_is_international():
    assert minimax_httpstream.DEFAULT_HOST == "api.minimax.io"

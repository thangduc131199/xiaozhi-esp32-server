"""Tests for core/utils/i18n.py."""
import os

from core.utils import i18n


def test_default_language_is_vietnamese():
    assert i18n.get_language({}) == "vi"
    assert i18n.get_language(None) == "vi"


def test_language_normalization_and_fallback():
    assert i18n.get_language({"default_language": "zh_CN"}) == "zh"
    assert i18n.get_language({"default_language": "vi-VN"}) == "vi"
    assert i18n.get_language({"default_language": "fr"}) == "vi"


def test_t_formats_and_selects_language():
    assert "123456" in i18n.t({}, "bind_code_prompt", code="123456")
    assert i18n.t({"default_language": "zh"}, "goodbye") == "再见，祝您生活愉快！"


def test_all_languages_have_same_keys():
    keys = set(i18n.MESSAGES[i18n.DEFAULT_LANGUAGE])
    for lang, messages in i18n.MESSAGES.items():
        assert set(messages) == keys, lang


def test_asset_path_prefers_localized_file():
    path = i18n.asset_path({}, "bind_code.wav")
    assert path == os.path.join("config/assets", "vi", "bind_code.wav")
    assert i18n.asset_path({"default_language": "zh"}, "bind_code.wav") == os.path.join(
        "config/assets", "bind_code.wav"
    )


def test_asset_path_falls_back_when_missing():
    assert i18n.asset_path({}, "tts_notify.mp3") == os.path.join(
        "config/assets", "tts_notify.mp3"
    )

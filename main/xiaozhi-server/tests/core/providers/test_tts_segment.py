"""Tests for TTS sentence boundary detection with ASCII punctuation."""
from core.providers.tts.base import TTSProviderBase


def test_period_followed_by_space_is_boundary():
    text = "Xin chào. Hôm nay"
    assert TTSProviderBase._rfind_boundary(text, ".") == text.index(".")


def test_trailing_period_waits_for_more_text():
    assert TTSProviderBase._rfind_boundary("Xin chào.", ".") == -1


def test_decimal_and_abbreviation_are_not_boundaries():
    assert TTSProviderBase._rfind_boundary("Nhiệt độ 3.5 độ ở TP.HCM", ".") == -1


def test_last_valid_period_is_found():
    text = "Trời đẹp. Nhiệt độ 25.5 độ"
    assert TTSProviderBase._rfind_boundary(text, ".") == text.index(".")


def test_chinese_punctuation_unchanged():
    assert TTSProviderBase._rfind_boundary("你好。世界", "。") == 2

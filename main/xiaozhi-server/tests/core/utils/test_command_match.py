"""Tests for wakeup/exit command matching (Vietnamese + Chinese)."""
import unicodedata

from core.utils.util import match_command, normalize_command_text


def test_normalize_keeps_vietnamese_tones_and_drops_spaces():
    assert normalize_command_text("Tạm biệt!") == "tạmbiệt"


def test_match_vietnamese_ignores_case_punctuation_and_spaces():
    assert match_command("Tạm biệt.", ["tạm biệt", "thoát"]) is True
    assert match_command("XIN CHÀO tiểu trí", ["xin chào tiểu trí"]) is True


def test_match_handles_decomposed_unicode():
    decomposed = unicodedata.normalize("NFD", "tạm biệt")
    assert match_command(decomposed, ["tạm biệt"]) is True


def test_match_does_not_confuse_tones():
    assert match_command("tam biet", ["tạm biệt"]) is False


def test_match_chinese_still_works():
    assert match_command("退出。", ["退出", "关闭"]) is True


def test_match_empty_inputs():
    assert match_command("", ["thoát"]) is False
    assert match_command("thoát", None) is False

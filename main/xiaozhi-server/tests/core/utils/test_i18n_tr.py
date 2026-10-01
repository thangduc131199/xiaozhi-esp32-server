"""Tests for i18n.tr() and that every translated call-site string has a translation."""
import pathlib
import re

from core.utils import i18n

PROJECT_ROOT = pathlib.Path(__file__).resolve().parents[3]
TR_CALL = re.compile(r'i18n\.tr\(\s*[\w.]+\s*,\s*"((?:[^"\\]|\\.)*)"')


def test_tr_translates_and_formats():
    assert i18n.tr({}, "请求超时") == "Yêu cầu quá thời gian"
    assert i18n.tr({}, "工具 {name} 不存在", name="x") == "Công cụ x không tồn tại"


def test_tr_keeps_chinese_for_zh_and_unknown_text():
    assert i18n.tr({"default_language": "zh"}, "工具 {name} 不存在", name="x") == "工具 x 不存在"
    assert i18n.tr({}, "some search result") == "some search result"


def test_all_tr_call_sites_have_vietnamese_translation():
    missing = []
    for path in list((PROJECT_ROOT / "plugins_func").rglob("*.py")) + list((PROJECT_ROOT / "core").rglob("*.py")):
        for text in TR_CALL.findall(path.read_text(encoding="utf-8")):
            text = text.encode().decode("unicode_escape").encode("latin-1").decode("utf-8")
            if text not in i18n.ZH_TO_VI:
                missing.append(f"{path.name}: {text}")
    assert not missing, missing

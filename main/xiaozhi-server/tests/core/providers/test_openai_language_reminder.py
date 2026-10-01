"""Tests for the reply language reminder appended by the OpenAI-compatible LLM provider."""
from core.providers.llm.openai.openai import LLMProvider

BASE_CONFIG = {
    "type": "openai",
    "api_key": "test-key",
    "base_url": "https://api.deepseek.com",
    "model_name": "deepseek-chat",
}
DIALOGUE = [{"role": "system", "content": "prompt"}, {"role": "user", "content": "xin chào"}]


def make_llm(**overrides):
    return LLMProvider({**BASE_CONFIG, **overrides})


def test_vietnamese_reminder_appended_without_mutating_dialogue():
    llm = make_llm(default_language="vi")
    dialogue = list(DIALOGUE)
    result = llm._with_language_reminder(dialogue)
    assert result[-1]["role"] == "system"
    assert "tiếng Việt" in result[-1]["content"]
    assert dialogue == DIALOGUE


def test_blank_value_from_admin_uses_default():
    llm = make_llm(default_language="vi", reply_language_reminder="  ")
    assert "tiếng Việt" in llm.reply_language_reminder


def test_no_reminder_for_chinese():
    llm = make_llm(default_language="zh")
    assert llm._with_language_reminder(DIALOGUE) == DIALOGUE


def test_no_default_reminder_for_auxiliary_llm_without_language():
    # 意图识别/记忆总结的辅助LLM不带 default_language，不追加提醒
    assert make_llm().reply_language_reminder == ""


def test_custom_reminder_and_off():
    assert make_llm(default_language="vi", reply_language_reminder="Reply in Vietnamese.").reply_language_reminder == "Reply in Vietnamese."
    assert make_llm(default_language="vi", reply_language_reminder="off").reply_language_reminder == ""

"""Tests that internal prompts follow default_language."""
import re

from core.providers.intent.intent_llm.intent_llm import IntentProvider
from core.providers.memory.mem_local_short import mem_local_short

CJK = re.compile(r"[一-鿿]")
FUNCTIONS = [
    {"function": {"name": "play_music", "description": "d", "parameters": {"properties": {"song_name": {"type": "string", "description": "x"}}}}}
]


def test_intent_prompt_vietnamese_by_default():
    prompt = IntentProvider({}).get_intent_system_prompt(FUNCTIONS)
    assert "Danh sách hàm khả dụng" in prompt
    assert not CJK.search(prompt)


def test_intent_prompt_chinese_when_configured():
    prompt = IntentProvider({"default_language": "zh"}).get_intent_system_prompt(FUNCTIONS)
    assert "可用的函数列表" in prompt


def test_memory_prompt_vietnamese_has_no_chinese():
    assert not CJK.search(mem_local_short.MEMORY_PROMPTS["vi"]["prompt"])
    assert set(mem_local_short.MEMORY_PROMPTS["vi"]) == set(mem_local_short.MEMORY_PROMPTS["zh"])

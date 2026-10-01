-- OpenAI接口LLM新增“回复语种提醒”字段：每次请求时追加到对话末尾，防止模型改用中文等其他语种
-- LLM giao diện OpenAI: thêm trường "Lời nhắc ngôn ngữ trả lời"
UPDATE `ai_model_provider`
SET `fields` = JSON_ARRAY_APPEND(
    `fields`, '$',
    JSON_OBJECT('key', 'reply_language_reminder', 'type', 'string', 'label', 'Lời nhắc ngôn ngữ trả lời (để trống dùng mặc định theo ngôn ngữ hệ thống, điền off để tắt)')
)
WHERE `id` = 'SYSTEM_LLM_openai'
  AND JSON_SEARCH(`fields`, 'one', 'reply_language_reminder', NULL, '$[*].key') IS NULL;

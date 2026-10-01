-- 缩短OpenAI语音识别“上下文提示词”和OpenAI接口LLM“回复语种提醒”字段标签，避免长标签挤压智控台输入框
-- Rút gọn nhãn hai trường mới để không làm co ô nhập trên trang quản trị. Chỉ cập nhật khi nhãn vẫn là bản gốc.
UPDATE `ai_model_provider`
SET `fields` = JSON_SET(
    `fields`,
    REPLACE(JSON_UNQUOTE(JSON_SEARCH(`fields`, 'one', 'prompt', NULL, '$[*].key')), '.key', '.label'),
    'Gợi ý ngữ cảnh (trống = mặc định)'
)
WHERE `id` = 'SYSTEM_ASR_OpenaiASR'
  AND JSON_SEARCH(`fields`, 'one', 'Gợi ý ngữ cảnh / từ vựng cho nhận dạng (để trống dùng mặc định theo ngôn ngữ)', NULL, '$[*].label') IS NOT NULL;

UPDATE `ai_model_provider`
SET `fields` = JSON_SET(
    `fields`,
    REPLACE(JSON_UNQUOTE(JSON_SEARCH(`fields`, 'one', 'reply_language_reminder', NULL, '$[*].key')), '.key', '.label'),
    'Nhắc ngôn ngữ trả lời (trống = mặc định, off = tắt)'
)
WHERE `id` = 'SYSTEM_LLM_openai'
  AND JSON_SEARCH(`fields`, 'one', 'Lời nhắc ngôn ngữ trả lời (để trống dùng mặc định theo ngôn ngữ hệ thống, điền off để tắt)', NULL, '$[*].label') IS NOT NULL;

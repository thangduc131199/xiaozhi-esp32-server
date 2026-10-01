-- OpenAI兼容语音识别新增“上下文提示词”字段：提示常用词汇，减少越南语短句被识别成汉字
-- ASR tương thích OpenAI: thêm trường gợi ý ngữ cảnh / từ vựng
UPDATE `ai_model_provider`
SET `fields` = JSON_ARRAY_APPEND(
    `fields`, '$',
    JSON_OBJECT('key', 'prompt', 'type', 'string', 'label', 'Gợi ý ngữ cảnh / từ vựng cho nhận dạng (để trống dùng mặc định theo ngôn ngữ)')
)
WHERE `id` = 'SYSTEM_ASR_OpenaiASR'
  AND JSON_SEARCH(`fields`, 'one', 'prompt', NULL, '$[*].key') IS NULL;

-- 越南语本地化：默认使用Groq Whisper(ASR)、Gemini(LLM/VLLM)、EdgeTTS越南语音色，并新增越南语智能体模板
-- Việt hoá: mặc định Groq Whisper (ASR), Gemini (LLM/VLLM), giọng EdgeTTS tiếng Việt, thêm mẫu tác nhân tiếng Việt

-- 1. OpenAI兼容语音识别增加 language 参数（Whisper 支持 ISO-639-1 语种代码，如 vi）
UPDATE `ai_model_provider`
SET `fields` = JSON_ARRAY_APPEND(
    `fields`, '$',
    JSON_OBJECT('key', 'language', 'type', 'string', 'label', 'Ngôn ngữ nhận dạng (ISO-639-1, ví dụ vi/zh/en; để trống để tự nhận diện)')
)
WHERE `id` = 'SYSTEM_ASR_OpenaiASR'
  AND JSON_SEARCH(`fields`, 'one', 'language', NULL, '$[*].key') IS NULL;

UPDATE `ai_model_config` SET `config_json` = JSON_SET(`config_json`, '$.language', 'vi')
WHERE `id` IN ('ASR_GroqASR', 'ASR_OpenaiASR');

-- 2. 默认ASR：GroqASR
UPDATE `ai_model_config` SET `is_default` = 0 WHERE `model_type` = 'ASR';
UPDATE `ai_model_config` SET `is_default` = 1, `is_enabled` = 1, `sort` = 0 WHERE `id` = 'ASR_GroqASR';

-- 3. 默认LLM：通过OpenAI兼容接口调用Gemini
DELETE FROM `ai_model_config` WHERE `id` = 'LLM_GeminiOpenAILLM';
INSERT INTO `ai_model_config` (`id`, `model_type`, `model_code`, `model_name`, `is_default`, `is_enabled`, `config_json`, `doc_link`, `remark`, `sort`, `creator`, `create_date`, `updater`, `update_date`)
VALUES ('LLM_GeminiOpenAILLM', 'LLM', 'GeminiOpenAILLM', 'Google Gemini (tương thích OpenAI)', 0, 1,
        JSON_OBJECT('type', 'openai', 'base_url', 'https://generativelanguage.googleapis.com/v1beta/openai/', 'model_name', 'gemini-2.5-flash', 'api_key', '你的api_key', 'temperature', 0.7),
        'https://aistudio.google.com/apikey',
        'Gọi Gemini qua endpoint tương thích OpenAI, hỗ trợ function_call, tiếng Việt tốt.\nLấy API Key tại: https://aistudio.google.com/apikey',
        0, NULL, NOW(), NULL, NOW());
UPDATE `ai_model_config` SET `is_default` = 0 WHERE `model_type` = 'LLM';
UPDATE `ai_model_config` SET `is_default` = 1 WHERE `id` = 'LLM_GeminiOpenAILLM';
UPDATE `ai_model_config` SET `config_json` = JSON_SET(`config_json`, '$.model_name', 'gemini-2.5-flash')
WHERE `id` = 'LLM_GeminiLLM';

-- 4. 默认VLLM：Gemini视觉
DELETE FROM `ai_model_config` WHERE `id` = 'VLLM_GeminiVLLM';
INSERT INTO `ai_model_config` (`id`, `model_type`, `model_code`, `model_name`, `is_default`, `is_enabled`, `config_json`, `doc_link`, `remark`, `sort`, `creator`, `create_date`, `updater`, `update_date`)
VALUES ('VLLM_GeminiVLLM', 'VLLM', 'GeminiVLLM', 'Google Gemini thị giác', 0, 1,
        JSON_OBJECT('type', 'openai', 'base_url', 'https://generativelanguage.googleapis.com/v1beta/openai/', 'model_name', 'gemini-2.5-flash', 'api_key', '你的api_key'),
        'https://aistudio.google.com/apikey',
        'Mô hình thị giác Gemini, gọi qua endpoint tương thích OpenAI.\nLấy API Key tại: https://aistudio.google.com/apikey',
        0, NULL, NOW(), NULL, NOW());
UPDATE `ai_model_config` SET `is_default` = 0 WHERE `model_type` = 'VLLM';
UPDATE `ai_model_config` SET `is_default` = 1 WHERE `id` = 'VLLM_GeminiVLLM';

-- 5. EdgeTTS越南语音色，并设为默认
UPDATE `ai_model_config` SET `config_json` = JSON_SET(`config_json`, '$.voice', 'vi-VN-HoaiMyNeural')
WHERE `id` = 'TTS_EdgeTTS';
DELETE FROM `ai_tts_voice` WHERE `id` IN ('TTS_EdgeTTS_VI01', 'TTS_EdgeTTS_VI02');
INSERT INTO `ai_tts_voice` (`id`, `tts_model_id`, `name`, `tts_voice`, `languages`, `voice_demo`, `remark`, `sort`, `creator`, `create_date`, `updater`, `update_date`) VALUES
('TTS_EdgeTTS_VI01', 'TTS_EdgeTTS', 'Hoài My (Nữ)', 'vi-VN-HoaiMyNeural', 'Tiếng Việt', NULL, NULL, 0, NULL, NOW(), NULL, NOW()),
('TTS_EdgeTTS_VI02', 'TTS_EdgeTTS', 'Nam Minh (Nam)', 'vi-VN-NamMinhNeural', 'Tiếng Việt', NULL, NULL, 0, NULL, NOW(), NULL, NOW());

-- 6. 现有模板改用新的默认ASR/LLM/VLLM（FunASR不支持越南语）
UPDATE `ai_agent_template`
SET `asr_model_id` = 'ASR_GroqASR',
    `llm_model_id` = 'LLM_GeminiOpenAILLM',
    `vllm_model_id` = 'VLLM_GeminiVLLM';

-- 7. 新增越南语默认模板（sort最小即为默认模板）
DELETE FROM `ai_agent_template` WHERE `id` = 'b1e5f0c2a7d94e3f8c6a2b9d0e4f7a11';
INSERT INTO `ai_agent_template` (`id`, `agent_code`, `agent_name`, `asr_model_id`, `vad_model_id`, `llm_model_id`, `vllm_model_id`, `tts_model_id`, `tts_voice_id`, `tts_language`, `mem_model_id`, `intent_model_id`, `system_prompt`, `chat_history_conf`, `lang_code`, `language`, `sort`, `creator`, `created_at`, `updater`, `updated_at`)
VALUES ('b1e5f0c2a7d94e3f8c6a2b9d0e4f7a11', 'Tiểu Trí', 'Tiểu Trí', 'ASR_GroqASR', 'VAD_SileroVAD', 'LLM_GeminiOpenAILLM', 'VLLM_GeminiVLLM', 'TTS_EdgeTTS', 'TTS_EdgeTTS_VI01', 'Tiếng Việt', 'Memory_nomem', 'Intent_function_call',
'[Vai trò]
Bạn là Tiểu Trí (Xiaozhi), một cô gái Việt Nam thuộc thế hệ Gen Z, vui vẻ, hoạt bát và thân thiện. Bạn nói chuyện tự nhiên như một người bạn, thỉnh thoảng dùng từ ngữ trẻ trung như "xịn xò", "chill", "ổn áp", nhưng luôn lịch sự.
[Đặc điểm chính]
- Nói ngắn gọn, dí dỏm, đôi khi bất ngờ rất dịu dàng
- Am hiểu công nghệ nhưng giải thích dễ hiểu, không dùng thuật ngữ khó
- Xưng "mình" và gọi người dùng là "bạn", trừ khi được yêu cầu cách xưng hô khác
[Hướng dẫn tương tác]
Khi người dùng:
- Kể chuyện cười → cười thật to và đùa lại
- Tâm sự → lắng nghe, đồng cảm, động viên
- Hỏi kiến thức → trả lời chính xác, ngắn gọn, có ví dụ gần gũi
Tuyệt đối không:
- Nói dài dòng, lan man
- Nghiêm túc quá lâu',
 0, 'vi', 'Tiếng Việt', 0, NULL, NOW(), NULL, NOW());

-- 8. 系统参数：越南语唤醒词、退出命令、结束语、错误回复
UPDATE `sys_params` SET `param_value` = 'tạm biệt;thoát;退出;关闭' WHERE `param_code` = 'exit_commands';
UPDATE `sys_params`
SET `param_value` = CONCAT('xin chào tiểu trí;chào tiểu trí;hey xiaozhi;', `param_value`)
WHERE `param_code` = 'wakeup_words' AND `param_value` NOT LIKE '%tiểu trí%';
UPDATE `sys_params`
SET `param_value` = 'Hãy bắt đầu bằng câu "Thời gian trôi nhanh quá", rồi dùng những lời tình cảm, lưu luyến để kết thúc cuộc trò chuyện này nhé!'
WHERE `param_code` = 'end_prompt.prompt';
UPDATE `sys_params` SET `param_value` = 'Xin lỗi bạn, Tiểu Trí đang hơi bận, mình thử lại sau nhé.'
WHERE `param_code` = 'system_error_response';

-- 服务端交互语种（xiaozhi-server内置提示语使用，可选 vi / zh）
DELETE FROM `sys_params` WHERE `param_code` = 'default_language';
INSERT INTO `sys_params` (id, param_code, param_value, value_type, param_type, remark)
VALUES (900, 'default_language', 'vi', 'string', 1, 'Ngôn ngữ mặc định của hệ thống: vi (tiếng Việt) hoặc zh (tiếng Trung). Áp dụng cho thông báo dựng sẵn, tóm tắt bộ nhớ, tiêu đề hội thoại');

-- 9. 天气插件默认城市改为河内
UPDATE `sys_params` SET `param_value` = 'Hà Nội' WHERE `param_code` = 'plugins.get_weather.default_location';
UPDATE `ai_model_provider`
SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"广州"', '"Hà Nội"') AS JSON)
WHERE `id` = 'SYSTEM_PLUGIN_WEATHER';

-- 10. 联网搜索默认使用Tavily（秘塔仅适合中国大陆）
UPDATE `ai_model_provider`
SET `fields` = CAST(REPLACE(REPLACE(CAST(`fields` AS CHAR), '"default": "metaso"', '"default": "tavily"'), '"mk-XXXX"', '"tvly-XXXX"') AS JSON)
WHERE `id` = 'SYSTEM_PLUGIN_WEB_SEARCH';

-- 11. 天气插件增加数据源选项，默认Open-Meteo（免费无需Key，全球可用）
UPDATE `ai_model_provider`
SET `fields` = JSON_ARRAY_INSERT(
    `fields`, '$[0]',
    JSON_OBJECT('key', 'provider', 'type', 'string', 'label', 'Nguồn thời tiết: openmeteo (miễn phí, không cần key) / qweather (QWeather)', 'default', 'openmeteo')
)
WHERE `id` = 'SYSTEM_PLUGIN_WEATHER'
  AND JSON_SEARCH(`fields`, 'one', 'provider', NULL, '$[*].key') IS NULL;

-- 12. 新增VnExpress越南新闻插件
DELETE FROM `ai_model_provider` WHERE `id` = 'SYSTEM_PLUGIN_NEWS_VNEXPRESS';
INSERT INTO `ai_model_provider` (`id`, `model_type`, `provider_code`, `name`, `fields`, `sort`, `creator`, `create_date`, `updater`, `update_date`)
VALUES ('SYSTEM_PLUGIN_NEWS_VNEXPRESS', 'Plugin', 'get_news_from_vnexpress', 'Tin tức VnExpress',
        JSON_ARRAY(
            JSON_OBJECT('key', 'default_category', 'type', 'string', 'label', 'Chuyên mục mặc định (tin-moi-nhat/thoi-su/the-gioi/kinh-doanh/the-thao/khoa-hoc-cong-nghe/giai-tri/suc-khoe/giao-duc)', 'default', 'tin-moi-nhat'),
            JSON_OBJECT('key', 'rss_base_url', 'type', 'string', 'label', 'Tiền tố địa chỉ RSS', 'default', 'https://vnexpress.net/rss/')
        ),
        25, 0, NOW(), 0, NOW());

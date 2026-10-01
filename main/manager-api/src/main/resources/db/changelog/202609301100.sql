-- MiniMax流式TTS：支持国际版API地址（api.minimax.io）与语种增强（language_boost），移除默认的中文发音字典，新增越南语音色
-- MiniMax TTS: hỗ trợ endpoint quốc tế và language_boost, bỏ từ điển phát âm tiếng Trung mặc định, thêm giọng tiếng Việt

-- 1. 供应器字段：api_host、language_boost
UPDATE `ai_model_provider`
SET `fields` = JSON_ARRAY_INSERT(
    `fields`, '$[0]',
    JSON_OBJECT('key', 'api_host', 'type', 'string', 'label', 'Địa chỉ API (quốc tế: api.minimax.io, Trung Quốc: api.minimaxi.com)')
)
WHERE `id` = 'SYSTEM_TTS_MinimaxStreamTTS'
  AND JSON_SEARCH(`fields`, 'one', 'api_host', NULL, '$[*].key') IS NULL;

UPDATE `ai_model_provider`
SET `fields` = JSON_ARRAY_APPEND(
    `fields`, '$',
    JSON_OBJECT('key', 'language_boost', 'type', 'string', 'label', 'Tăng cường ngôn ngữ (ví dụ Vietnamese; để trống để tự chọn theo ngôn ngữ giọng)')
)
WHERE `id` = 'SYSTEM_TTS_MinimaxStreamTTS'
  AND JSON_SEARCH(`fields`, 'one', 'language_boost', NULL, '$[*].key') IS NULL;

-- 2. 模型配置：默认国际版地址与越南语增强，移除中文示例发音字典
UPDATE `ai_model_config`
SET `config_json` = JSON_SET(`config_json`, '$.api_host', 'api.minimax.io')
WHERE `id` = 'TTS_MinimaxStreamTTS' AND JSON_EXTRACT(`config_json`, '$.api_host') IS NULL;

UPDATE `ai_model_config`
SET `config_json` = JSON_SET(`config_json`, '$.language_boost', 'Vietnamese')
WHERE `id` = 'TTS_MinimaxStreamTTS' AND JSON_EXTRACT(`config_json`, '$.language_boost') IS NULL;

UPDATE `ai_model_config`
SET `config_json` = JSON_REMOVE(`config_json`, '$.pronunciation_dict')
WHERE `id` = 'TTS_MinimaxStreamTTS'
  AND JSON_CONTAINS(JSON_EXTRACT(`config_json`, '$.pronunciation_dict.tone'), '"处理/(chu3)(li3)"');

UPDATE `ai_model_config`
SET `remark` = CONCAT(`remark`, '\n\nLưu ý cho tài khoản quốc tế (đăng ký ở minimax.io, ví dụ tại Việt Nam):\n- Đặt "Địa chỉ API" là api.minimax.io (mặc định). Tài khoản Trung Quốc dùng api.minimaxi.com; API Key của hai vùng không dùng lẫn được (lỗi 2049 invalid api key)\n- Tài khoản quốc tế có thể để trống Group ID\n- Giọng tiếng Việt: Vietnamese_kindhearted_girl; nên đặt "Tăng cường ngôn ngữ" là Vietnamese\n- Tên mô hình phải đúng mã của MiniMax, ví dụ speech-02-turbo, speech-02-hd')
WHERE `id` = 'TTS_MinimaxStreamTTS' AND `remark` NOT LIKE '%api.minimax.io%';

-- 3. 越南语音色（已存在相同音色时不重复添加）
INSERT INTO `ai_tts_voice` (`id`, `tts_model_id`, `name`, `tts_voice`, `languages`, `voice_demo`, `remark`, `sort`, `creator`, `create_date`, `updater`, `update_date`)
SELECT 'TTS_MinimaxStreamTTS_VI01', 'TTS_MinimaxStreamTTS', 'Nữ Việt Nam - dịu dàng', 'Vietnamese_kindhearted_girl', 'Tiếng Việt', NULL, NULL, 0, NULL, NOW(), NULL, NOW()
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM `ai_tts_voice` WHERE `tts_model_id` = 'TTS_MinimaxStreamTTS' AND `tts_voice` = 'Vietnamese_kindhearted_girl'
);

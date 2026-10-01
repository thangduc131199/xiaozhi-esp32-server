-- 添加 ElevenLabs 语音识别（Scribe）供应器与模型配置
-- Thêm ASR ElevenLabs (Scribe). Chỉ thêm khi chưa tồn tại, không ghi đè chỉnh sửa của quản trị viên.
INSERT INTO `ai_model_provider` (`id`, `model_type`, `provider_code`, `name`, `fields`, `sort`, `creator`, `create_date`, `updater`, `update_date`)
SELECT 'SYSTEM_ASR_ElevenLabsASR', 'ASR', 'elevenlabs', 'ElevenLabs nhận dạng giọng nói',
    '[{"key":"api_key","label":"API Key","type":"password"},{"key":"base_url","label":"Địa chỉ API","type":"string"},{"key":"model_name","label":"Mô hình","type":"string"},{"key":"language","label":"Ngôn ngữ (vi, trống = tự nhận)","type":"string"},{"key":"keyterms","label":"Từ khoá ưu tiên (phẩy)","type":"string"},{"key":"output_dir","label":"Thư mục tạm","type":"string"}]',
    19, 1, NOW(), 1, NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `ai_model_provider` WHERE `id` = 'SYSTEM_ASR_ElevenLabsASR');

INSERT INTO `ai_model_config` (`id`, `model_type`, `model_code`, `model_name`, `is_default`, `is_enabled`, `config_json`, `doc_link`, `remark`, `sort`, `creator`, `create_date`, `updater`, `update_date`)
SELECT 'ASR_ElevenLabsASR', 'ASR', 'ElevenLabsASR', 'ElevenLabs nhận dạng giọng nói', 0, 1,
    '{"type": "elevenlabs", "api_key": "", "base_url": "https://api.elevenlabs.io/v1/speech-to-text", "model_name": "scribe_v2", "language": "vi", "keyterms": "", "output_dir": "tmp/"}',
    'https://elevenlabs.io/docs/capabilities/speech-to-text',
    'Hướng dẫn cấu hình ElevenLabs ASR:
1. Đăng nhập https://elevenlabs.io và vào Settings > API Keys (https://elevenlabs.io/app/settings/api-keys)
2. Tạo API Key, bật quyền Speech to Text, rồi dán vào ô API Key
3. Mô hình mặc định scribe_v2; ngôn ngữ vi cho tiếng Việt, để trống để tự nhận diện
4. Từ khoá ưu tiên (tuỳ chọn, cách nhau bằng dấu phẩy) giúp nhận đúng tên riêng nhưng ElevenLabs tính thêm phí',
    22, NULL, NOW(), NULL, NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `ai_model_config` WHERE `id` = 'ASR_ElevenLabsASR');

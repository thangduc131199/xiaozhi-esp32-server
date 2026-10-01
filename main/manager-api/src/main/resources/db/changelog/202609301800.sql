-- 添加 ElevenLabs 实时语音识别（scribe_v2_realtime，WebSocket流式）供应器与模型配置
-- Thêm ASR ElevenLabs realtime. Chỉ thêm khi chưa tồn tại, không ghi đè chỉnh sửa của quản trị viên.
INSERT INTO `ai_model_provider` (`id`, `model_type`, `provider_code`, `name`, `fields`, `sort`, `creator`, `create_date`, `updater`, `update_date`)
SELECT 'SYSTEM_ASR_ElevenLabsStreamASR', 'ASR', 'elevenlabs_stream', 'ElevenLabs nhận dạng giọng nói (realtime)',
    '[{"key":"api_key","label":"API Key","type":"password"},{"key":"ws_url","label":"Địa chỉ WebSocket","type":"string"},{"key":"model_name","label":"Mô hình","type":"string"},{"key":"language","label":"Ngôn ngữ (vi, trống = tự nhận)","type":"string"},{"key":"keyterms","label":"Từ khoá ưu tiên (phẩy)","type":"string"},{"key":"output_dir","label":"Thư mục tạm","type":"string"}]',
    20, 1, NOW(), 1, NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `ai_model_provider` WHERE `id` = 'SYSTEM_ASR_ElevenLabsStreamASR');

INSERT INTO `ai_model_config` (`id`, `model_type`, `model_code`, `model_name`, `is_default`, `is_enabled`, `config_json`, `doc_link`, `remark`, `sort`, `creator`, `create_date`, `updater`, `update_date`)
SELECT 'ASR_ElevenLabsStreamASR', 'ASR', 'ElevenLabsStreamASR', 'ElevenLabs nhận dạng giọng nói (realtime)', 0, 1,
    '{"type": "elevenlabs_stream", "api_key": "", "ws_url": "wss://api.elevenlabs.io/v1/speech-to-text/realtime", "model_name": "scribe_v2_realtime", "language": "vi", "keyterms": "", "output_dir": "tmp/"}',
    'https://elevenlabs.io/docs/api-reference/speech-to-text/v-1-speech-to-text-realtime',
    'Hướng dẫn cấu hình ElevenLabs ASR realtime:
1. Dùng API Key ElevenLabs có quyền Speech to Text (có thể dùng chung key với TTS ElevenLabs)
2. Âm thanh được gửi liên tục trong lúc nói qua WebSocket, khi ngừng nói sẽ có kết quả gần như ngay lập tức (nhanh hơn bản thường)
3. Mô hình scribe_v2_realtime; ngôn ngữ vi cho tiếng Việt, để trống để tự nhận diện
4. Từ khoá ưu tiên (tuỳ chọn, cách nhau bằng dấu phẩy) giúp nhận đúng tên riêng nhưng ElevenLabs tính thêm phí',
    23, NULL, NOW(), NULL, NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `ai_model_config` WHERE `id` = 'ASR_ElevenLabsStreamASR');

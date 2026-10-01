-- 添加 ElevenLabs 流式语音合成供应器、模型配置与默认音色
-- Thêm TTS ElevenLabs (streaming). Chỉ thêm khi chưa tồn tại, không ghi đè chỉnh sửa của quản trị viên.
INSERT INTO `ai_model_provider` (`id`, `model_type`, `provider_code`, `name`, `fields`, `sort`, `creator`, `create_date`, `updater`, `update_date`)
SELECT 'SYSTEM_TTS_ElevenLabsStreamTTS', 'TTS', 'elevenlabs_stream', 'ElevenLabs tổng hợp giọng nói (streaming)',
    '[{"key":"api_key","label":"API Key","type":"password"},{"key":"voice_id","label":"Voice ID","type":"string"},{"key":"model_id","label":"Mô hình","type":"string"},{"key":"language_code","label":"Ngôn ngữ (vi)","type":"string"},{"key":"stability","label":"Độ ổn định (0-1)","type":"string"},{"key":"similarity_boost","label":"Độ giống giọng (0-1)","type":"string"},{"key":"style","label":"Phong cách (0-1)","type":"string"},{"key":"speed","label":"Tốc độ (0.7-1.2)","type":"string"},{"key":"output_dir","label":"Thư mục tạm","type":"string"}]',
    21, 1, NOW(), 1, NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `ai_model_provider` WHERE `id` = 'SYSTEM_TTS_ElevenLabsStreamTTS');

INSERT INTO `ai_model_config` (`id`, `model_type`, `model_code`, `model_name`, `is_default`, `is_enabled`, `config_json`, `doc_link`, `remark`, `sort`, `creator`, `create_date`, `updater`, `update_date`)
SELECT 'TTS_ElevenLabsStreamTTS', 'TTS', 'ElevenLabsStreamTTS', 'ElevenLabs tổng hợp giọng nói (streaming)', 0, 1,
    '{"type": "elevenlabs_stream", "api_key": "", "voice_id": "EXAVITQu4vr4xnSDxMaL", "model_id": "eleven_flash_v2_5", "language_code": "vi", "stability": "", "similarity_boost": "", "style": "", "speed": "", "output_dir": "tmp/"}',
    'https://elevenlabs.io/docs/api-reference/text-to-speech/stream',
    'Hướng dẫn cấu hình ElevenLabs TTS:
1. Đăng nhập https://elevenlabs.io, vào Settings > API Keys (https://elevenlabs.io/app/settings/api-keys), tạo API Key có quyền Text to Speech rồi dán vào ô API Key
2. Voice ID: chọn giọng trong danh sách giọng của tác nhân, hoặc sao chép ID từ Voice Library (https://elevenlabs.io/app/voice-library)
3. Tiếng Việt chỉ được hỗ trợ bởi mô hình eleven_flash_v2_5 (độ trễ thấp, mặc định) hoặc eleven_v3; eleven_multilingual_v2 không đọc được tiếng Việt
4. Các tham số độ ổn định, độ giống giọng, phong cách, tốc độ có thể để trống để dùng mặc định của ElevenLabs',
    24, NULL, NOW(), NULL, NOW()
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `ai_model_config` WHERE `id` = 'TTS_ElevenLabsStreamTTS');

INSERT INTO `ai_tts_voice` (`id`, `tts_model_id`, `name`, `tts_voice`, `languages`, `remark`, `sort`, `create_date`, `update_date`)
SELECT 'TTS_ElevenLabsStreamTTS_0001', 'TTS_ElevenLabsStreamTTS', 'Sarah (nữ)', 'EXAVITQu4vr4xnSDxMaL', 'Tiếng Việt', 'Giọng có sẵn của ElevenLabs', 1, NOW(), NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `ai_tts_voice` WHERE `id` = 'TTS_ElevenLabsStreamTTS_0001');

INSERT INTO `ai_tts_voice` (`id`, `tts_model_id`, `name`, `tts_voice`, `languages`, `remark`, `sort`, `create_date`, `update_date`)
SELECT 'TTS_ElevenLabsStreamTTS_0002', 'TTS_ElevenLabsStreamTTS', 'Rachel (nữ)', '21m00Tcm4TlvDq8ikWAM', 'Tiếng Việt', 'Giọng có sẵn của ElevenLabs', 2, NOW(), NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `ai_tts_voice` WHERE `id` = 'TTS_ElevenLabsStreamTTS_0002');

INSERT INTO `ai_tts_voice` (`id`, `tts_model_id`, `name`, `tts_voice`, `languages`, `remark`, `sort`, `create_date`, `update_date`)
SELECT 'TTS_ElevenLabsStreamTTS_0003', 'TTS_ElevenLabsStreamTTS', 'George (nam)', 'JBFqnCBsd6RMkjVDRZzb', 'Tiếng Việt', 'Giọng có sẵn của ElevenLabs', 3, NOW(), NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `ai_tts_voice` WHERE `id` = 'TTS_ElevenLabsStreamTTS_0003');

INSERT INTO `ai_tts_voice` (`id`, `tts_model_id`, `name`, `tts_voice`, `languages`, `remark`, `sort`, `create_date`, `update_date`)
SELECT 'TTS_ElevenLabsStreamTTS_0004', 'TTS_ElevenLabsStreamTTS', 'Adam (nam)', 'pNInz6obpgDQGcFmaJgB', 'Tiếng Việt', 'Giọng có sẵn của ElevenLabs', 4, NOW(), NOW()
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM `ai_tts_voice` WHERE `id` = 'TTS_ElevenLabsStreamTTS_0004');

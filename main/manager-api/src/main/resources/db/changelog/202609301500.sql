-- 服务端音乐插件新增 Zing MP3 在线音乐配置项（音乐来源、Zing接口参数）
-- Plugin phát nhạc: thêm cấu hình nguồn nhạc Zing MP3. Chỉ áp dụng khi plugin chưa có trường nào.
UPDATE `ai_model_provider`
SET `fields` = JSON_ARRAY(
    JSON_OBJECT('key', 'source', 'type', 'string', 'label', 'Nguồn nhạc (zing / local)', 'default', 'zing'),
    JSON_OBJECT('key', 'zing_base_url', 'type', 'string', 'label', 'Địa chỉ Zing MP3', 'default', 'https://zingmp3.vn'),
    JSON_OBJECT('key', 'zing_version', 'type', 'string', 'label', 'Zing version', 'default', '1.6.34'),
    JSON_OBJECT('key', 'zing_api_key', 'type', 'string', 'label', 'Zing apiKey', 'default', '88265e23d4284f25963e6eedac8fbfa3'),
    JSON_OBJECT('key', 'zing_secret_key', 'type', 'string', 'label', 'Zing secretKey', 'default', '2aa2d1c561e809b267f3638c4a307aab')
)
WHERE `id` = 'SYSTEM_PLUGIN_MUSIC'
  AND (`fields` IS NULL OR JSON_LENGTH(`fields`) = 0);

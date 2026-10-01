# Triển khai xiaozhi-esp32-server cho tiếng Việt tại Việt Nam

Bản này đã được chỉnh để **tiếng Việt là ngôn ngữ mặc định** và **không phụ thuộc máy chủ ở Trung Quốc**. Tiếng Trung vẫn dùng được, chỉ cần đổi cấu hình.

## Những gì đã thay đổi

| Hạng mục | Trước | Sau |
|---|---|---|
| Nhận dạng giọng nói (ASR) | FunASR SenseVoice (không hỗ trợ tiếng Việt) | Groq Whisper `whisper-large-v3-turbo`, `language: vi` |
| Mô hình ngôn ngữ (LLM) | GLM-4-Flash (bigmodel.cn) | Gemini 2.5 Flash, gọi qua endpoint tương thích OpenAI |
| Mô hình thị giác (VLLM) | GLM-4V-Flash | Gemini 2.5 Flash |
| Tổng hợp giọng nói (TTS) | EdgeTTS `zh-CN-XiaoxiaoNeural` | EdgeTTS `vi-VN-HoaiMyNeural` (có thêm `vi-VN-NamMinhNeural`) |
| Thời tiết | QWeather, mặc định Quảng Châu | Open-Meteo (miễn phí, không cần key), mặc định Hà Nội |
| Tin tức | NewsNow / Chinanews | VnExpress RSS (plugin `get_news_from_vnexpress`) |
| Tìm kiếm web | Metaso | Tavily |
| Phát nhạc | Chỉ nhạc cục bộ | Zing MP3 trực tuyến, lỗi thì quay về nhạc cục bộ |
| Nhà cung cấp mới (tuỳ chọn) | - | ElevenLabs ASR (Scribe, realtime) và TTS streaming; MiniMax TTS bản quốc tế `api.minimax.io` |
| Chống trả lời lạc ngôn ngữ | - | LLM tương thích OpenAI có "nhắc ngôn ngữ trả lời"; ASR tương thích OpenAI có "gợi ý ngữ cảnh" giúp câu tiếng Việt ngắn không bị nhận thành chữ Hán |
| Định vị theo IP | whois.pconline.com.cn (chỉ nhận IP Trung Quốc) | ip-api.com |
| Múi giờ | Asia/Shanghai (+8) | Asia/Ho_Chi_Minh (+7) |
| Nguồn cài đặt | Mirror Aliyun, npmmirror, ghcr.nju.edu.cn | PyPI, Maven Central, npmjs, ghcr.io |
| Giao diện quản trị | Mặc định tiếng Trung | Mặc định tiếng Việt |

Ngoài ra:
- Câu đánh thức, lệnh thoát, lời chào, lời tạm biệt, thông báo lỗi và file âm thanh hướng dẫn liên kết thiết bị đều có bản tiếng Việt.
- Âm lịch tính theo lịch Việt Nam (múi giờ UTC+7), ví dụ "ngày 19 tháng 8 năm Bính Ngọ". Kết quả đúng cả ở những ngày lịch Việt lệch lịch Trung, như Tết 1985 hay Tết 2007. Plugin tra âm lịch trả về Can Chi, con giáp kiểu Việt (Mão = Mèo), tiết khí và ngày lễ Việt Nam.
- Prompt nội bộ đều có bản tiếng Việt: phân tích ý định, tóm tắt bộ nhớ và đặt tiêu đề hội thoại. Nhờ vậy bộ nhớ tóm tắt và tiêu đề chat hiện trên trang quản trị là tiếng Việt.
- Trang quản trị không còn hiện tiếng Trung ở tên mô hình, hướng dẫn cấu hình, nhãn trường, tên giọng đọc, ghi chú tham số, mẫu tác nhân, danh sách mã vùng (Việt Nam +84 đứng đầu) và kết quả công cụ trong lịch sử chat. Phần này do file `202609301000.sql` thực hiện.
- TTS ngắt câu tại dấu chấm tiếng Việt nhưng không cắt nhầm số thập phân hay chữ viết tắt ("3.5", "TP.HCM").
- Câu đánh thức và lệnh thoát được so khớp không phân biệt hoa thường, dấu câu hay khoảng trắng. Thanh điệu vẫn được phân biệt.

## 1. Chuẩn bị API key

| Dịch vụ | Dùng cho | Đăng ký |
|---|---|---|
| Groq | Nhận dạng giọng nói (mặc định) | https://console.groq.com/keys |
| Google AI Studio | LLM và thị giác (Gemini, mặc định) | https://aistudio.google.com/apikey |
| Tavily (tuỳ chọn) | Tìm kiếm web | https://app.tavily.com/home |
| ElevenLabs (tuỳ chọn) | ASR realtime / TTS streaming chất lượng cao | https://elevenlabs.io/app/settings/api-keys |
| MiniMax (tuỳ chọn) | TTS streaming, dùng bản quốc tế `api.minimax.io` | https://www.minimax.io |

EdgeTTS, Open-Meteo, VnExpress, Zing MP3 và ip-api.com không cần key.

## 2. Lấy mã nguồn và build image

Yêu cầu: máy Linux (hoặc Windows/macOS có Docker Desktop) đã cài Docker và Docker Compose v2.

```bash
git clone https://github.com/thangduc131199/xiaozhi-esp32-server.git
cd xiaozhi-esp32-server
```

> ⚠️ Image `ghcr.io/xinnan-tech/...` và script cài nhanh `docker-setup.sh` đều là **bản gốc (upstream)**, **không có** các thay đổi ở trên. Đừng dùng `docker-setup.sh` cho bản Việt hoá. Hãy tự build image từ thư mục gốc của repo:

```bash
docker build -f Dockerfile-server-base -t xiaozhi-esp32-server:server-base .
# Dockerfile-server mặc định dùng image base của upstream (thư viện Python giống nhau nên vẫn chạy được);
# muốn dùng base vừa build thì sửa dòng FROM thành xiaozhi-esp32-server:server-base
docker build -f Dockerfile-server -t xiaozhi-esp32-server:server_vn .
docker build -f Dockerfile-web -t xiaozhi-esp32-server:web_vn .
```

Sau đó sửa `image:` trong `main/xiaozhi-server/docker-compose_all.yml` (bản Full) hoặc `main/xiaozhi-server/docker-compose.yml` (chỉ server) thành tag vừa build:
- `xiaozhi-esp32-server:server_vn` cho service `xiaozhi-esp32-server`
- `xiaozhi-esp32-server:web_vn` cho service `xiaozhi-esp32-server-web`

**Về file `model.pt`:** cả hai file compose đều mount `./models/SenseVoiceSmall/model.pt`. Model này chỉ dùng cho FunASR cục bộ (không hỗ trợ tiếng Việt). Nếu file không tồn tại, Docker sẽ tạo một *thư mục* trùng tên và container báo lỗi khi khởi động. Chọn một trong hai cách:
- Xoá (hoặc comment) dòng mount `model.pt` trong file compose. Nên chọn cách này nếu bạn dùng Groq.
- Hoặc tải model về:

  ```bash
  mkdir -p main/xiaozhi-server/models/SenseVoiceSmall
  curl -fL https://huggingface.co/FunAudioLLM/SenseVoiceSmall/resolve/main/model.pt \
       -o main/xiaozhi-server/models/SenseVoiceSmall/model.pt
  ```

## 3. Cài đặt bản Full (có trang quản trị)

Mọi lệnh dưới đây chạy trong `main/xiaozhi-server`.

**Bước 1. Tạo file cấu hình cho server**

```bash
cd main/xiaozhi-server
mkdir -p data
cp config_from_api.yaml data/.config.yaml
```

**Bước 2. Khởi động**

```bash
docker compose -f docker-compose_all.yml up -d
docker logs -f xiaozhi-esp32-server-web
```

Chờ đến khi log có dòng `Started AdminApplication`. Lần chạy đầu, Liquibase tự tạo bảng và chạy các file `202609300900.sql` đến `202609301800.sql`:

| File | Nội dung |
|---|---|
| `202609300900` | Đặt mặc định tiếng Việt và mẫu tác nhân "Tiểu Trí" |
| `202609301000` | Dịch dữ liệu hiển thị sang tiếng Việt (chỉ sửa giá trị còn nguyên bản gốc) |
| `202609301100` | MiniMax TTS: endpoint quốc tế, `language_boost`, thêm giọng tiếng Việt |
| `202609301200`–`1400` | LLM tương thích OpenAI: thêm "nhắc ngôn ngữ trả lời". ASR tương thích OpenAI: thêm "gợi ý ngữ cảnh" |
| `202609301500` | Plugin phát nhạc: nguồn Zing MP3 |
| `202609301600`–`1800` | ElevenLabs: ASR (Scribe), TTS streaming, ASR realtime |

Các file này chỉ thêm hoặc sửa dữ liệu còn nguyên bản gốc, không ghi đè chỉnh sửa của quản trị viên.

**Bước 3. Tạo tài khoản quản trị**

Mở `http://<ip-của-bạn>:8002` và đăng ký tài khoản. **Tài khoản đầu tiên là siêu quản trị**, các tài khoản sau là người dùng thường.

**Bước 4. Kết nối server với trang quản trị**

1. Đăng nhập bằng siêu quản trị, vào **Quản lý tham số** và sao chép giá trị của `server.secret`.
2. Mở `data/.config.yaml` và sửa phần `manager-api`:

   ```yaml
   manager-api:
     url: http://xiaozhi-esp32-server-web:8002/xiaozhi
     secret: <giá trị server.secret vừa sao chép>
   ```

   Trong Docker, `url` phải dùng tên container `xiaozhi-esp32-server-web`, không dùng `127.0.0.1`.
3. Khởi động lại server và kiểm tra log:

   ```bash
   docker restart xiaozhi-esp32-server
   docker logs -f xiaozhi-esp32-server
   ```

   Nếu log in ra địa chỉ Websocket và OTA là kết nối thành công.

**Bước 5. Điền API key và địa chỉ**

1. Vào **Cấu hình mô hình** và điền API key cho:
   - `Groq nhận dạng giọng nói` (ASR)
   - `Google Gemini (tương thích OpenAI)` (LLM)
   - `Google Gemini thị giác` (VLLM)
2. Vào **Quản lý tham số** và đặt theo IP LAN hoặc tên miền của bạn:
   - `server.websocket` = `ws://<ip>:8000/xiaozhi/v1/`
   - `server.ota` = `http://<ip>:8002/xiaozhi/ota/`
   - `server.vision_explain` = `http://<ip>:8003/mcp/vision/explain`

   Không dùng `127.0.0.1` hay `localhost`, vì thiết bị ESP32 không truy cập được.
3. Tác nhân tạo mới sẽ dùng mẫu "Tiểu Trí", giọng Hoài My, cùng các plugin nhạc (Zing MP3), thời tiết và tin tức VnExpress.

Tác nhân đã tạo **trước** khi nâng cấp vẫn giữ mô hình cũ. Hãy đổi chúng sang Groq, Gemini và giọng tiếng Việt trong phần chỉnh sửa tác nhân.

**Cổng sử dụng:** `8000` (websocket), `8002` (trang quản trị + OTA), `8003` (HTTP: thị giác, OTA đơn giản). Nhớ mở các cổng này trên firewall.

**Nâng cấp:** `git pull`, build lại image (bước 2), rồi `docker compose -f docker-compose_all.yml up -d`. Dữ liệu MySQL nằm trong `main/xiaozhi-server/mysql/data`. Hãy sao lưu thư mục này trước khi nâng cấp.

## 4. Chỉ chạy xiaozhi-server (không có trang quản trị)

Mọi lệnh chạy trong `main/xiaozhi-server`. Tạo `data/.config.yaml` với các key của bạn:

```yaml
server:
  websocket: ws://<ip-của-bạn>:8000/xiaozhi/v1/
  vision_explain: http://<ip-của-bạn>:8003/mcp/vision/explain
ASR:
  GroqASR:
    api_key: gsk_xxx
LLM:
  GeminiOpenAILLM:
    api_key: AIza_xxx
VLLM:
  GeminiVLLM:
    api_key: AIza_xxx
plugins:
  web_search:
    api_key: tvly-xxx
```

Các giá trị còn lại (mô hình được chọn, giọng đọc, câu đánh thức, `default_language: vi`) đã có sẵn trong `config.yaml`. `.config.yaml` chỉ cần chứa những giá trị muốn ghi đè.

Khởi động (nhớ xử lý dòng mount `model.pt` như ở mục 2):

```bash
docker compose -f docker-compose.yml up -d
docker logs -f xiaozhi-esp32-server
```

Server dùng cổng `8000` (websocket) và `8003` (OTA `http://<ip>:8003/xiaozhi/ota/`, thị giác).

## 5. Chạy từ mã nguồn (không dùng Docker)

**xiaozhi-server** (cần Python 3.10, `ffmpeg` và `libopus`; có thể dùng conda):

```bash
conda create -n xiaozhi-esp32-server python=3.10 -y
conda activate xiaozhi-esp32-server
conda install conda-forge::libopus conda-forge::ffmpeg -y
cd main/xiaozhi-server
pip install -r requirements.txt
# tạo data/.config.yaml như mục 4 (chỉ server) hoặc như mục 3 với url http://127.0.0.1:8002/xiaozhi (bản Full)
python app.py
```

**manager-api** (bản Full; cần JDK 21, Maven, MySQL 8 và Redis):
1. Tạo database `xiaozhi_esp32_server` (utf8mb4) và chạy Redis ở `127.0.0.1:6379`.
2. Kiểm tra thông tin kết nối trong `main/manager-api/src/main/resources/application-dev.yml` (mặc định `root` / `123456`).
3. Chạy `mvn spring-boot:run` trong `main/manager-api`. Liquibase tự tạo bảng. Kiểm tra tại `http://localhost:8002/xiaozhi/doc.html`.

**manager-web**:

```bash
cd main/manager-web
npm install
npm run serve   # mở http://localhost:8001
```

Hướng dẫn chi tiết bằng tiếng Trung xem tại [Deployment_all.md](./Deployment_all.md) và [Deployment.md](./Deployment.md).

## 6. Kiểm tra hoạt động

- Mở địa chỉ OTA trên trình duyệt: `http://<ip>:8002/xiaozhi/ota/` (bản Full) hoặc `http://<ip>:8003/xiaozhi/ota/` (chỉ server). Nếu trang trả về thông tin websocket là OTA chạy đúng.
- Kiểm tra hội thoại mà chưa cần thiết bị: trong `main/digital-human`, chạy `python start.py`, mở `http://127.0.0.1:8006/index.html` rồi kết nối tới `ws://<ip>:8000/xiaozhi/v1/`.
- Kiểm tra key và tốc độ phản hồi: chạy `python performance_tester.py` trong `main/xiaozhi-server`.

## 7. Firmware ESP32

Firmware gốc trỏ tới `https://api.tenclass.net/xiaozhi/ota/`. Khi build firmware (xem [firmware-build.md](./firmware-build.md)):
- đặt `OTA_URL` thành `http://<ip-của-bạn>:8002/xiaozhi/ota/` nếu dùng bản Full, hoặc `http://<ip-của-bạn>:8003/xiaozhi/ota/` nếu chỉ chạy xiaozhi-server
- chọn ngôn ngữ giao diện thiết bị là `vi-VN`

## 8. Tuỳ chỉnh thêm

- **Quay lại tiếng Trung:**
  - Đặt tham số `default_language` thành `zh`. Tham số này điều khiển thông báo dựng sẵn, file âm thanh, âm lịch và các prompt nội bộ (ý định, tóm tắt bộ nhớ, tiêu đề chat).
  - Chọn lại giọng `zh-CN-*` cho tác nhân.
  - Thêm lại từ đánh thức và lệnh thoát tiếng Trung nếu cần.
  - Dữ liệu hiển thị trong DB đã dịch sẽ không tự chuyển về tiếng Trung.
- **Giọng nam:** chọn `Nam Minh (Nam)` (`vi-VN-NamMinhNeural`).
- **Dùng lại QWeather:** đặt `provider` của plugin thời tiết thành `qweather`.
- **Tạo lại file âm thanh hướng dẫn** (ví dụ với giọng khác). Chạy trong `main/xiaozhi-server`, máy cần có `ffmpeg`:

  ```bash
  python scripts/gen_assets.py --lang vi --voice vi-VN-NamMinhNeural
  ```

  File được ghi vào `config/assets/vi/`.

## Lưu ý

- Từ đánh thức vẫn giữ "你好小智". Firmware mặc định gửi đúng chuỗi này khi phát hiện từ đánh thức, nên xoá đi thì server sẽ không nhận ra lời gọi.
- Vài chỗ tiếng Trung còn lại là cố ý:
  - tên sản phẩm "Doubao-语音合成" trên console Volcengine
  - nguồn tin mặc định của plugin NewsNow (nguồn Trung Quốc, không bật mặc định)
  - tên riêng của giọng tiếng Trung, đã phiên âm pinyin
- Các nhà cung cấp Trung Quốc (Aliyun, Doubao, Tencent, Xunfei...) vẫn còn trong danh sách, nhưng mặc định không dùng.

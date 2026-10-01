-- 越南语本地化：将智控台显示的内置数据（模型名称、说明、供应器字段、音色、系统参数备注、智能体模板、字典）翻译为越南语
-- Việt hoá dữ liệu hiển thị trên trang quản trị. Mỗi câu UPDATE chỉ áp dụng khi giá trị vẫn là bản gốc, không ghi đè chỉnh sửa của quản trị viên.

-- 1. 模型配置名称
UPDATE `ai_model_config` SET `model_name` = 'Groq nhận dạng giọng nói' WHERE `id` = 'ASR_GroqASR' AND `model_name` = 'Groq语音识别';
UPDATE `ai_model_config` SET `model_name` = 'FunASR nhận dạng giọng nói (cục bộ)' WHERE `id` = 'ASR_FunASR' AND `model_name` = 'FunASR语音识别';
UPDATE `ai_model_config` SET `model_name` = 'FunASR Server nhận dạng giọng nói' WHERE `id` = 'ASR_FunASRServer' AND `model_name` = 'FunASR服务语音识别';
UPDATE `ai_model_config` SET `model_name` = 'iFlytek nhận dạng giọng nói (streaming)' WHERE `id` = 'ASR_XunfeiStream' AND `model_name` = '讯飞语音识别(流式)';
UPDATE `ai_model_config` SET `model_name` = 'Aliyun nhận dạng giọng nói (streaming)' WHERE `id` = 'ASR_AliyunStreamASR' AND `model_name` = '阿里云语音识别(流式)';
UPDATE `ai_model_config` SET `model_name` = 'Doubao nhận dạng giọng nói (streaming)' WHERE `id` = 'ASR_DoubaoStreamASR' AND `model_name` = '豆包语音识别(流式)';
UPDATE `ai_model_config` SET `model_name` = 'Doubao nhận dạng giọng nói 2.0 (streaming)' WHERE `id` = 'ASR_DoubaoStreamASRV2' AND `model_name` = '豆包语音识别2.0(流式)';
UPDATE `ai_model_config` SET `model_name` = 'Tencent nhận dạng giọng nói' WHERE `id` = 'ASR_TencentASR' AND `model_name` = '腾讯语音识别';
UPDATE `ai_model_config` SET `model_name` = 'Baidu nhận dạng giọng nói' WHERE `id` = 'ASR_BaiduASR' AND `model_name` = '百度语音识别';
UPDATE `ai_model_config` SET `model_name` = 'Doubao nhận dạng giọng nói' WHERE `id` = 'ASR_DoubaoASR' AND `model_name` = '豆包语音识别';
UPDATE `ai_model_config` SET `model_name` = 'Aliyun nhận dạng giọng nói' WHERE `id` = 'ASR_AliyunASR' AND `model_name` = '阿里云语音识别';
UPDATE `ai_model_config` SET `model_name` = 'Sherpa nhận dạng giọng nói' WHERE `id` = 'ASR_SherpaASR' AND `model_name` = 'Sherpa语音识别';
UPDATE `ai_model_config` SET `model_name` = 'OpenAI nhận dạng giọng nói' WHERE `id` = 'ASR_OpenaiASR' AND `model_name` = 'OpenAI语音识别';
UPDATE `ai_model_config` SET `model_name` = 'VOSK nhận dạng giọng nói (offline)' WHERE `id` = 'ASR_VoskASR' AND `model_name` = 'VOSK离线语音识别';
UPDATE `ai_model_config` SET `model_name` = 'Qwen3 Flash nhận dạng giọng nói' WHERE `id` = 'ASR_Qwen3Flash' AND `model_name` = 'Qwen3Flash语音识别';
UPDATE `ai_model_config` SET `model_name` = 'Aliyun Bailian Paraformer nhận dạng thời gian thực' WHERE `id` = 'ASR_AliyunBLStream' AND `model_name` = '阿里百炼Paraformer实时语音识别';
UPDATE `ai_model_config` SET `model_name` = 'Không nhận diện ý định' WHERE `id` = 'Intent_nointent' AND `model_name` = '无意图识别';
UPDATE `ai_model_config` SET `model_name` = 'Nhận diện ý định bằng LLM riêng' WHERE `id` = 'Intent_intent_llm' AND `model_name` = '外挂的大模型意图识别';
UPDATE `ai_model_config` SET `model_name` = 'LLM tự gọi hàm (function call)' WHERE `id` = 'Intent_function_call' AND `model_name` = '大模型自主函数调用';
UPDATE `ai_model_config` SET `model_name` = 'Zhipu AI (GLM)' WHERE `id` = 'LLM_ChatGLMLLM' AND `model_name` = '智谱AI';
UPDATE `ai_model_config` SET `model_name` = 'Ollama (mô hình cục bộ)' WHERE `id` = 'LLM_OllamaLLM' AND `model_name` = 'Ollama本地模型';
UPDATE `ai_model_config` SET `model_name` = 'Qwen (Tongyi Qianwen)' WHERE `id` = 'LLM_AliLLM' AND `model_name` = '通义千问';
UPDATE `ai_model_config` SET `model_name` = 'Ứng dụng tác nhân Aliyun Bailian' WHERE `id` = 'LLM_AliAppLLM' AND `model_name` = '百炼智能体应用';
UPDATE `ai_model_config` SET `model_name` = 'Doubao LLM' WHERE `id` = 'LLM_DoubaoLLM' AND `model_name` = '豆包大模型';
UPDATE `ai_model_config` SET `model_name` = 'Google Gemini (SDK gốc)' WHERE `id` = 'LLM_GeminiLLM' AND `model_name` = '谷歌Gemini';
UPDATE `ai_model_config` SET `model_name` = 'Xinference mô hình lớn' WHERE `id` = 'LLM_XinferenceLLM' AND `model_name` = 'Xinference大模型';
UPDATE `ai_model_config` SET `model_name` = 'Xinference mô hình nhỏ' WHERE `id` = 'LLM_XinferenceSmallLLM' AND `model_name` = 'Xinference小模型';
UPDATE `ai_model_config` SET `model_name` = 'iFlytek Spark' WHERE `id` = 'LLM_XunfeiSparkLLM' AND `model_name` = '讯飞星火认知大模型';
UPDATE `ai_model_config` SET `model_name` = 'Volcengine AI Gateway (LLM)' WHERE `id` = 'LLM_VolcesAiGatewayLLM' AND `model_name` = '火山引擎边缘大模型网关';
UPDATE `ai_model_config` SET `model_name` = 'Không có bộ nhớ' WHERE `id` = 'Memory_nomem' AND `model_name` = '无记忆';
UPDATE `ai_model_config` SET `model_name` = 'Bộ nhớ ngắn hạn cục bộ (tóm tắt)' WHERE `id` = 'Memory_mem_local_short' AND `model_name` = '本地短期记忆（总结记忆）';
UPDATE `ai_model_config` SET `model_name` = 'Chỉ lưu lịch sử chat (không tóm tắt)' WHERE `id` = 'Memory_mem_report_only' AND `model_name` = '仅上报聊天记录（不总结记忆）';
UPDATE `ai_model_config` SET `model_name` = 'Bộ nhớ Mem0AI' WHERE `id` = 'Memory_mem0ai' AND `model_name` = 'Mem0AI记忆';
UPDATE `ai_model_config` SET `model_name` = 'Bộ nhớ PowerMem' WHERE `id` = 'Memory_powermem' AND `model_name` = 'PowerMem记忆';
UPDATE `ai_model_config` SET `model_name` = 'Edge tổng hợp giọng nói' WHERE `id` = 'TTS_EdgeTTS' AND `model_name` = 'Edge语音合成';
UPDATE `ai_model_config` SET `model_name` = 'Volcengine (streaming)' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS' AND `model_name` = '火山引擎(流式)';
UPDATE `ai_model_config` SET `model_name` = 'Aliyun Bailian (streaming)' WHERE `id` = 'TTS_AliBLStreamTTS' AND `model_name` = '阿里百炼(流式)';
UPDATE `ai_model_config` SET `model_name` = 'iFlytek (streaming)' WHERE `id` = 'TTS_XunFeiStreamTTS' AND `model_name` = '科大讯飞(流式)';
UPDATE `ai_model_config` SET `model_name` = 'Minimax (streaming)' WHERE `id` = 'TTS_MinimaxStreamTTS' AND `model_name` = 'Minimax(流式)';
UPDATE `ai_model_config` SET `model_name` = 'Aliyun (streaming)' WHERE `id` = 'TTS_AliyunStreamTTS' AND `model_name` = '阿里云(流式)';
UPDATE `ai_model_config` SET `model_name` = 'IndexTTS (streaming)' WHERE `id` = 'TTS_IndexStreamTTS' AND `model_name` = 'IndexTTS(流式)';
UPDATE `ai_model_config` SET `model_name` = 'PaddleSpeech (streaming)' WHERE `id` = 'TTS_PaddleSpeechTTS' AND `model_name` = 'PaddleSpeech(流式)';
UPDATE `ai_model_config` SET `model_name` = 'Doubao tổng hợp giọng nói' WHERE `id` = 'TTS_DoubaoTTS' AND `model_name` = '豆包语音合成';
UPDATE `ai_model_config` SET `model_name` = 'Tencent tổng hợp giọng nói' WHERE `id` = 'TTS_TencentTTS' AND `model_name` = '腾讯语音合成';
UPDATE `ai_model_config` SET `model_name` = 'Aliyun tổng hợp giọng nói' WHERE `id` = 'TTS_AliyunTTS' AND `model_name` = '阿里云语音合成';
UPDATE `ai_model_config` SET `model_name` = 'OpenAI tổng hợp giọng nói' WHERE `id` = 'TTS_OpenAITTS' AND `model_name` = 'OpenAI语音合成';
UPDATE `ai_model_config` SET `model_name` = 'SiliconFlow tổng hợp giọng nói' WHERE `id` = 'TTS_CosyVoiceSiliconflow' AND `model_name` = '硅基流动语音合成';
UPDATE `ai_model_config` SET `model_name` = 'Coze tổng hợp giọng nói (tiếng Trung)' WHERE `id` = 'TTS_CozeCnTTS' AND `model_name` = 'Coze中文语音合成';
UPDATE `ai_model_config` SET `model_name` = 'FishSpeech tổng hợp giọng nói' WHERE `id` = 'TTS_FishSpeech' AND `model_name` = 'FishSpeech语音合成';
UPDATE `ai_model_config` SET `model_name` = 'Doubao tổng hợp giọng nói 2.0 (streaming)' WHERE `id` = 'TTS_HSDSTTS_V2' AND `model_name` = '豆包语音合成2.0(流式)';
UPDATE `ai_model_config` SET `model_name` = '302AI tổng hợp giọng nói' WHERE `id` = 'TTS_TTS302AI' AND `model_name` = '302AI语音合成';
UPDATE `ai_model_config` SET `model_name` = 'Volcengine AI Gateway (TTS)' WHERE `id` = 'TTS_VolcesAiGatewayTTS' AND `model_name` = '火山引擎边缘大模型网关';
UPDATE `ai_model_config` SET `model_name` = 'TTS tuỳ chỉnh' WHERE `id` = 'TTS_CustomTTS' AND `model_name` = '自定义语音合成';
UPDATE `ai_model_config` SET `model_name` = 'Phát hiện giọng nói (Silero VAD)' WHERE `id` = 'VAD_SileroVAD' AND `model_name` = '语音活动检测';
UPDATE `ai_model_config` SET `model_name` = 'Zhipu AI thị giác' WHERE `id` = 'VLLM_ChatGLMVLLM' AND `model_name` = '智谱视觉AI';
UPDATE `ai_model_config` SET `model_name` = 'Qwen thị giác' WHERE `id` = 'VLLM_QwenVLVLLM' AND `model_name` = '千问视觉模型';

-- 2. 模型配置说明
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Groq ASR:
1. Đăng nhập Groq Console: https://console.groq.com/home
2. Tạo API key: https://console.groq.com/keys
3. Có thể chọn mô hình whisper-large-v3-turbo hoặc whisper-large-v3 (distil-whisper-large-v3-en chỉ hỗ trợ tiếng Anh)
4. Trường "language" đặt là vi để nhận dạng tiếng Việt chính xác hơn; để trống để tự nhận diện ngôn ngữ
' WHERE `id` = 'ASR_GroqASR' AND `remark` = 'Groq ASR配置说明：
1.登录groq Console。https://console.groq.com/home
2.创建api-key  https://console.groq.com/keys
3.模型可以选择whisper-large-v3-turbo或whisper-large-v3（distil-whisper-large-v3-en仅支持英语转录）
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình mô hình FunASR cục bộ:
1. Cần tải tệp mô hình vào thư mục xiaozhi-server/models/SenseVoiceSmall
2. Hỗ trợ nhận dạng tiếng Trung, Nhật, Hàn, Quảng Đông (KHÔNG hỗ trợ tiếng Việt)
3. Suy luận cục bộ, không cần mạng
4. Tệp cần nhận dạng được lưu trong thư mục tmp/
5. Trường "Ngôn ngữ nhận dạng": auto = tự nhận diện; zh = tiếng Trung, en = tiếng Anh, ja = tiếng Nhật, ko = tiếng Hàn, yue = tiếng Quảng Đông.' WHERE `id` = 'ASR_FunASR' AND `remark` = 'FunASR本地模型配置说明：
1. 需要下载模型文件到xiaozhi-server/models/SenseVoiceSmall目录
2. 支持中日韩粤语音识别
3. 本地推理，无需网络连接
4. 待识别文件保存在tmp/目录
5. “识别语言”字段控制识别语种：auto = 自动检测；如需限定只识别中文可设为 zh（en=英语、ja=日语、ko=韩语、yue=粤语）。';
UPDATE `ai_model_config` SET `remark` = 'Tự triển khai FunASR và dùng API của FunASR, chỉ cần 5 lệnh:
Lệnh 1: mkdir -p ./funasr-runtime-resources/models
Lệnh 2: sudo docker run -d -p 10096:10095 --privileged=true -v $PWD/funasr-runtime-resources/models:/workspace/models registry.cn-hangzhou.aliyuncs.com/funasr_repo/funasr:funasr-runtime-sdk-online-cpu-0.1.12
Sau lệnh trên bạn sẽ vào trong container, tiếp tục lệnh 3: cd FunASR/runtime
Không thoát container, chạy tiếp lệnh 4: nohup bash run_server_2pass.sh --download-model-dir /workspace/models --vad-dir damo/speech_fsmn_vad_zh-cn-16k-common-onnx --model-dir iic/SenseVoiceSmall-onnx  --online-model-dir damo/speech_paraformer-large_asr_nat-zh-cn-16k-common-vocab8404-online-onnx  --punc-dir damo/punc_ct-transformer_zh-cn-common-vad_realtime-vocab272727-onnx --lm-dir damo/speech_ngram_lm_zh-cn-ai-wesp-fst --itn-dir thuduj12/fst_itn_zh --hotword /workspace/models/hotwords.txt > log.txt 2>&1 &
Tiếp tục lệnh 5: tail -f log.txt
Sau lệnh 5 bạn sẽ thấy log tải mô hình, tải xong là có thể kết nối sử dụng
Trên đây là suy luận bằng CPU, nếu có GPU xem thêm: https://github.com/modelscope/FunASR/blob/main/runtime/docs/SDK_advanced_guide_online_zh.md
Lưu ý: các mô hình trên chỉ hỗ trợ tiếng Trung, không hỗ trợ tiếng Việt.' WHERE `id` = 'ASR_FunASRServer' AND `remark` = '独立部署FunASR，使用FunASR的API服务，只需要五句话
第一句：mkdir -p ./funasr-runtime-resources/models
第二句：sudo docker run -d -p 10096:10095 --privileged=true -v $PWD/funasr-runtime-resources/models:/workspace/models registry.cn-hangzhou.aliyuncs.com/funasr_repo/funasr:funasr-runtime-sdk-online-cpu-0.1.12
上一句话执行后会进入到容器，继续第三句：cd FunASR/runtime
不要退出容器，继续在容器中执行第四句：nohup bash run_server_2pass.sh --download-model-dir /workspace/models --vad-dir damo/speech_fsmn_vad_zh-cn-16k-common-onnx --model-dir iic/SenseVoiceSmall-onnx  --online-model-dir damo/speech_paraformer-large_asr_nat-zh-cn-16k-common-vocab8404-online-onnx  --punc-dir damo/punc_ct-transformer_zh-cn-common-vad_realtime-vocab272727-onnx --lm-dir damo/speech_ngram_lm_zh-cn-ai-wesp-fst --itn-dir thuduj12/fst_itn_zh --hotword /workspace/models/hotwords.txt > log.txt 2>&1 &
上一句话执行后会进入到容器，继续第五句：tail -f log.txt
第五句话执行完后，会看到模型下载日志，下载完后就可以连接使用了
以上是使用CPU推理，如果有GPU，详细参考：https://github.com/modelscope/FunASR/blob/main/runtime/docs/SDK_advanced_guide_online_zh.md';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình iFlytek nhận dạng giọng nói (streaming):
1. Đăng nhập nền tảng mở iFlytek: https://www.xfyun.cn/
2. Tạo ứng dụng nhận dạng giọng nói để lấy APPID, APISecret, APIKey
3. Giải thích tham số:
   - app_id: ID ứng dụng, có sau khi tạo ứng dụng trên iFlytek
   - api_key: khóa API, dùng để xác thực
   - api_secret: khóa bí mật API, dùng để tạo chữ ký
   - domain: lĩnh vực nhận dạng, mặc định slm (chuyển giọng nói thông minh)
   - language: ngôn ngữ nhận dạng, mặc định zh_cn (tiếng Trung)
   - accent: phương ngữ, mặc định mandarin (phổ thông), hỗ trợ cantonese (Quảng Đông)...
   - dwa: hiệu chỉnh động, mặc định wpgs (bật)
   - output_dir: thư mục lưu âm thanh, mặc định tmp/
4. Hỗ trợ nhận dạng streaming thời gian thực, phù hợp cho tương tác giọng nói
5. Hỗ trợ nhiều phương ngữ và ngôn ngữ
' WHERE `id` = 'ASR_XunfeiStream' AND `remark` = '讯飞流式语音识别配置说明：
1. 登录讯飞开放平台 https://www.xfyun.cn/
2. 创建语音识别应用获取APPID、APISecret、APIKey
3. 参数说明：
   - app_id: 应用ID，在讯飞开放平台创建应用后获得
   - api_key: API密钥，用于接口鉴权
   - api_secret: API密钥，用于生成签名
   - domain: 识别领域，默认slm（智能化语音转写）
   - language: 识别语言，默认zh_cn（中文）
   - accent: 方言类型，默认mandarin（普通话），支持cantonese（粤语）等
   - dwa: 动态修正，默认wpgs（开启动态修正）
   - output_dir: 音频文件输出目录，默认tmp/
4. 支持实时流式识别，适用于实时语音交互场景
5. 支持多种方言和语言识别
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Aliyun ASR (streaming):
1. Khác biệt giữa Aliyun ASR và Aliyun ASR (streaming): bản thường nhận dạng một lần, bản streaming nhận dạng thời gian thực
2. Bản streaming có độ trễ thấp hơn, phù hợp cho tương tác giọng nói
3. Cần tạo ứng dụng trên bảng điều khiển Aliyun Intelligent Speech Interaction và lấy thông tin xác thực
4. Hỗ trợ nhận dạng tiếng Trung thời gian thực, có dự đoán dấu câu và chuẩn hoá văn bản ngược
5. Cần kết nối mạng, tệp đầu ra lưu trong thư mục tmp/
Các bước đăng ký:
1. Truy cập https://nls-portal.console.aliyun.com/ để bật dịch vụ
2. Truy cập https://nls-portal.console.aliyun.com/applist để tạo dự án và lấy appkey
3. Truy cập https://nls-portal.console.aliyun.com/overview để lấy token tạm thời (hoặc cấu hình access_key_id và access_key_secret để tự lấy)
4. Nếu cần quản lý token động, nên cấu hình access_key_id và access_key_secret
5. Tham số max_sentence_silence điều khiển thời gian phát hiện ngắt câu (ms), mặc định 800ms
Xem thêm tham số tại: https://help.aliyun.com/zh/isi/developer-reference/real-time-speech-recognition
' WHERE `id` = 'ASR_AliyunStreamASR' AND `remark` = '阿里云流式ASR配置说明：
1. 阿里云ASR和阿里云(流式)ASR的区别是：阿里云ASR是一次性识别，阿里云(流式)ASR是实时流式识别
2. 流式ASR具有更低的延迟和更好的实时性，适合语音交互场景
3. 需要在阿里云智能语音交互控制台创建应用并获取认证信息
4. 支持中文实时语音识别，支持标点符号预测和逆文本规范化
5. 需要网络连接，输出文件保存在tmp/目录
申请步骤：
1. 访问 https://nls-portal.console.aliyun.com/ 开通智能语音交互服务
2. 访问 https://nls-portal.console.aliyun.com/applist 创建项目并获取appkey
3. 访问 https://nls-portal.console.aliyun.com/overview 获取临时token（或配置access_key_id和access_key_secret自动获取）
4. 如需动态token管理，建议配置access_key_id和access_key_secret
5. max_sentence_silence参数控制断句检测时间（毫秒），默认800ms
如需了解更多参数配置，请参考：https://help.aliyun.com/zh/isi/developer-reference/real-time-speech-recognition
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Doubao ASR:
1. Khác biệt giữa Doubao ASR và Doubao ASR (streaming): bản thường tính phí theo lượt, bản streaming tính phí theo thời gian
2. Thường tính theo lượt rẻ hơn, nhưng bản streaming dùng mô hình lớn nên chất lượng tốt hơn
3. Cần tạo ứng dụng trên bảng điều khiển Volcengine và lấy appid, access_token
4. Hỗ trợ nhận dạng tiếng Trung
5. Cần kết nối mạng
6. Tệp đầu ra lưu trong thư mục tmp/
Các bước đăng ký:
1. Truy cập https://console.volcengine.com/speech/app
2. Tạo ứng dụng mới
3. Lấy appid và access_token
4. Điền vào cấu hình
Cài đặt từ nóng xem tại: https://www.volcengine.com/docs/6561/155738
Nếu bật chế độ đa ngôn ngữ, hãy đặt language; khi để trống, mô hình hỗ trợ tiếng Trung, tiếng Anh, tiếng Thượng Hải, Mân Nam, Tứ Xuyên, Thiểm Tây, Quảng Đông. Ngôn ngữ khác xem: https://www.volcengine.com/docs/6561/1354869
' WHERE `id` = 'ASR_DoubaoStreamASR' AND `remark` = '豆包ASR配置说明：
1. 豆包ASR和豆包(流式)ASR的区别是：豆包ASR是按次收费，豆包(流式)ASR是按时收费
2. 一般来说按次收费的更便宜，但是豆包(流式)ASR使用了大模型技术，效果更好
3. 需要在火山引擎控制台创建应用并获取appid和access_token
4. 支持中文语音识别
5. 需要网络连接
6. 输出文件保存在tmp/目录
申请步骤：
1. 访问 https://console.volcengine.com/speech/app
2. 创建新应用
3. 获取appid和access_token
4. 填入配置文件中
如需设置热词，请参考：https://www.volcengine.com/docs/6561/155738
如开启多语种识别模式，请设置language当该键为空时，该模型支持中英文、上海话、闽南语，四川、陕西、粤语识别。其他语种请参考：https://www.volcengine.com/docs/6561/1354869
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình mô hình nhận dạng giọng nói Doubao 2.0 (dựa trên seed-asr của Volcengine):
1. Truy cập https://www.volcengine.com/ để đăng ký tài khoản Volcengine
2. Truy cập https://console.volcengine.com/speech/service/10038 để bật mô hình nhận dạng streaming Doubao 2.0
3. Lấy appid và access_token ở cuối trang
4. Có hai loại ID tài nguyên: theo giờ (volc.seedasr.sauc.duration) và theo đồng thời (volc.seedasr.sauc.concurrent)
   - Theo giờ: cố định là volc.seedasr.sauc.duration
   - Theo đồng thời: cố định là volc.seedasr.sauc.concurrent

Tài liệu tham số chi tiết: https://www.volcengine.com/docs/6561/109979

Lưu ý:
- Mô hình 2.0 dùng ID tài nguyên volc.seedasr.sauc.duration, khác với Doubao ASR (streaming) (volc.bigasr.sauc.duration)
- Mô hình 2.0 rẻ hơn, nên dùng ID tài nguyên theo đồng thời khi có nhiều kết nối
' WHERE `id` = 'ASR_DoubaoStreamASRV2' AND `remark` = '豆包语音识别模型2.0配置说明（基于火山引擎seed-asr）：
1. 访问 https://www.volcengine.com/ 注册并开通火山引擎账号
2. 访问 https://console.volcengine.com/speech/service/10038 开通豆包流式语音识别模型2.0
3. 在页面底部获取appid和access_token
4. 资源ID有两种：小时版（volc.seedasr.sauc.duration）和并发版（volc.seedasr.sauc.concurrent）
   - 小时版：固定为：volc.seedasr.sauc.duration（豆包语音识别模型2.0）
   - 并发版：固定为：volc.seedasr.sauc.concurrent（豆包语音识别模型2.0）

详细参数文档：https://www.volcengine.com/docs/6561/109979

注意：
- 豆包语音识别模型2.0使用volc.seedasr.sauc.duration资源ID，与豆包语音识别(流式)（volc.bigasr.sauc.duration）不同
- 语音识别模型2.0价格更为便宜，建议在高并发场景下使用并发版资源ID
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Tencent ASR:
1. Cần tạo ứng dụng trên bảng điều khiển Tencent Cloud và lấy appid, secret_id, secret_key
2. Hỗ trợ nhận dạng tiếng Trung
3. Cần kết nối mạng
4. Tệp đầu ra lưu trong thư mục tmp/
Các bước đăng ký:
1. Truy cập https://console.cloud.tencent.com/cam/capi để lấy khóa
2. Truy cập https://console.cloud.tencent.com/asr/resourcebundle để nhận tài nguyên miễn phí
3. Lấy appid, secret_id và secret_key
4. Điền vào cấu hình' WHERE `id` = 'ASR_TencentASR' AND `remark` = '腾讯ASR配置说明：
1. 需要在腾讯云控制台创建应用并获取appid、secret_id和secret_key
2. 支持中文语音识别
3. 需要网络连接
4. 输出文件保存在tmp/目录
申请步骤：
1. 访问 https://console.cloud.tencent.com/cam/capi 获取密钥
2. 访问 https://console.cloud.tencent.com/asr/resourcebundle 领取免费资源
3. 获取appid、secret_id和secret_key
4. 填入配置文件中';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Baidu ASR:
1. Truy cập https://console.bce.baidu.com/ai-engine/old/#/ai/speech/app/list
2. Tạo ứng dụng mới
3. Lấy AppID, API Key và Secret Key
4. Điền vào cấu hình
Xem hạn mức tài nguyên: https://console.bce.baidu.com/ai-engine/old/#/ai/speech/overview/resource/list
Giải thích tham số ngôn ngữ: https://ai.baidu.com/ai-doc/SPEECH/0lbxfnc9b
' WHERE `id` = 'ASR_BaiduASR' AND `remark` = '百度ASR配置说明：
1. 访问 https://console.bce.baidu.com/ai-engine/old/#/ai/speech/app/list
2. 创建新应用
3. 获取AppID、API Key和Secret Key
4. 填入配置文件中
查看资源额度：https://console.bce.baidu.com/ai-engine/old/#/ai/speech/overview/resource/list
语言参数说明：https://ai.baidu.com/ai-doc/SPEECH/0lbxfnc9b
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Doubao ASR:
1. Khác biệt giữa Doubao ASR và Doubao ASR (streaming): bản thường tính phí theo lượt, bản streaming tính phí theo thời gian
2. Thường tính theo lượt rẻ hơn, nhưng bản streaming dùng mô hình lớn nên chất lượng tốt hơn
3. Cần tạo ứng dụng trên bảng điều khiển Volcengine và lấy appid, access_token
4. Hỗ trợ nhận dạng tiếng Trung
5. Cần kết nối mạng
6. Tệp đầu ra lưu trong thư mục tmp/
Các bước đăng ký:
1. Truy cập https://console.volcengine.com/speech/app
2. Tạo ứng dụng mới
3. Lấy appid và access_token
4. Điền vào cấu hình
Cài đặt từ nóng xem tại: https://www.volcengine.com/docs/6561/155738
' WHERE `id` = 'ASR_DoubaoASR' AND `remark` = '豆包ASR配置说明：
1. 豆包ASR和豆包(流式)ASR的区别是：豆包ASR是按次收费，豆包(流式)ASR是按时收费
2. 一般来说按次收费的更便宜，但是豆包(流式)ASR使用了大模型技术，效果更好
3. 需要在火山引擎控制台创建应用并获取appid和access_token
4. 支持中文语音识别
5. 需要网络连接
6. 输出文件保存在tmp/目录
申请步骤：
1. 访问 https://console.volcengine.com/speech/app
2. 创建新应用
3. 获取appid和access_token
4. 填入配置文件中
如需设置热词，请参考：https://www.volcengine.com/docs/6561/155738
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Aliyun ASR:
1. Truy cập https://nls-portal.console.aliyun.com/ để bật dịch vụ
2. Truy cập https://nls-portal.console.aliyun.com/applist để lấy appkey
3. Truy cập https://nls-portal.console.aliyun.com/overview để lấy token
4. Lấy access_key_id và access_key_secret
5. Điền vào cấu hình' WHERE `id` = 'ASR_AliyunASR' AND `remark` = '阿里云ASR配置说明：
1. 访问 https://nls-portal.console.aliyun.com/ 开通服务
2. 访问 https://nls-portal.console.aliyun.com/applist 获取appkey
3. 访问 https://nls-portal.console.aliyun.com/overview 获取token
4. 获取access_key_id和access_key_secret
5. 填入配置文件中';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình SherpaASR:
1. Khi chạy sẽ tự tải mô hình vào thư mục models/sherpa-onnx-sense-voice-zh-en-ja-ko-yue-2024-07-17
2. Hỗ trợ tiếng Trung, Anh, Nhật, Hàn, Quảng Đông (KHÔNG hỗ trợ tiếng Việt)
3. Suy luận cục bộ, không cần mạng
4. Tệp đầu ra lưu trong thư mục tmp/' WHERE `id` = 'ASR_SherpaASR' AND `remark` = 'SherpaASR配置说明：
1. 运行时自动下载模型文件到models/sherpa-onnx-sense-voice-zh-en-ja-ko-yue-2024-07-17目录
2. 支持中文、英文、日语、韩语、粤语等多种语言
3. 本地推理，无需网络连接
4. 输出文件保存在tmp/目录';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình OpenAI ASR:
1. Cần tạo tổ chức trên nền tảng OpenAI và lấy api_key
2. Hỗ trợ nhận dạng nhiều ngôn ngữ, bao gồm tiếng Việt; xem thêm https://platform.openai.com/docs/guides/speech-to-text
3. Cần kết nối mạng
4. Tệp đầu ra lưu trong thư mục tmp/
5. Trường "language" đặt là vi để nhận dạng tiếng Việt chính xác hơn; để trống để tự nhận diện
Các bước đăng ký:
1. Đăng nhập OpenAI Platform: https://auth.openai.com/log-in
2. Tạo API key: https://platform.openai.com/settings/organization/api-keys
3. Có thể chọn mô hình gpt-4o-transcribe hoặc gpt-4o-mini-transcribe
' WHERE `id` = 'ASR_OpenaiASR' AND `remark` = 'OpenAI ASR配置说明：
1. 需要在OpenAI开放平台创建组织并获取api_key
2. 支持中、英、日、韩等多种语音识别，具体参考文档https://platform.openai.com/docs/guides/speech-to-text
3. 需要网络连接
4. 输出文件保存在tmp/目录
申请步骤：
**OpenAi ASR申请步骤：**
1.登录OpenAI Platform。https://auth.openai.com/log-in
2.创建api-key  https://platform.openai.com/settings/organization/api-keys
3.模型可以选择gpt-4o-transcribe或GPT-4o mini Transcribe
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình VOSK ASR:
1. VOSK là thư viện nhận dạng giọng nói offline, hỗ trợ nhiều ngôn ngữ
2. Cần tải mô hình trước: https://alphacephei.com/vosk/models
3. Tiếng Việt dùng mô hình vosk-model-small-vn-0.4; tiếng Trung dùng vosk-model-small-cn-0.22 hoặc vosk-model-cn-0.22
4. Chạy hoàn toàn offline, không cần mạng
5. Tệp đầu ra lưu trong thư mục tmp/
Các bước sử dụng:
1. Truy cập https://alphacephei.com/vosk/models để tải mô hình
2. Giải nén vào thư mục models/vosk/ của dự án
3. Chỉ định đúng đường dẫn mô hình trong cấu hình
4. Lưu ý: kết quả VOSK không có dấu câu
' WHERE `id` = 'ASR_VoskASR' AND `remark` = 'VOSK ASR配置说明：
1. VOSK是一个离线语音识别库，支持多种语言
2. 需要先下载模型文件：https://alphacephei.com/vosk/models
3. 中文模型推荐使用vosk-model-small-cn-0.22或vosk-model-cn-0.22
4. 完全离线运行，无需网络连接
5. 输出文件保存在tmp/目录
使用步骤：
1. 访问 https://alphacephei.com/vosk/models 下载中文模型
2. 解压模型文件到项目目录下的models/vosk/文件夹
3. 在配置中指定正确的模型路径
4. 注意：VOSK中文模型输出不带标点符号，词与词之间会有空格
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Qwen3-ASR-Flash:
1. Đăng nhập nền tảng Aliyun Bailian: https://bailian.console.aliyun.com/
2. Tạo API-KEY: https://bailian.console.aliyun.com/#/api-key
3. Qwen3-ASR-Flash dựa trên mô hình đa phương thức Qwen, hỗ trợ nhận dạng đa ngôn ngữ, nhận dạng giọng hát, lọc tiếng ồn
' WHERE `id` = 'ASR_Qwen3Flash' AND `remark` = '通义千问Qwen3-ASR-Flash配置说明：
1. 登录阿里云百炼平台https://bailian.console.aliyun.com/
2. 创建API-KEY  https://bailian.console.aliyun.com/#/api-key
3.Qwen3-ASR-Flash基于通义千问多模态基座，支持多语言识别、歌唱识别、噪声拒识等功能
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Aliyun Bailian Paraformer nhận dạng thời gian thực:
1. Đăng nhập nền tảng Aliyun Bailian: https://bailian.console.aliyun.com/
2. Tạo API-KEY: https://bailian.console.aliyun.com/#/api-key
3. Mô hình hỗ trợ: paraformer-realtime-v2 (khuyên dùng), paraformer-realtime-8k-v2, paraformer-realtime-v1, paraformer-realtime-8k-v1
4. Tính năng:
   - Đa ngôn ngữ (tiếng Trung kèm phương ngữ, Anh, Nhật, Hàn, Đức, Pháp, Nga)
   - Tuỳ chỉnh từ nóng (tham số vocabulary_id), xem: https://help.aliyun.com/zh/model-studio/custom-hot-words?
   - Ngắt câu theo ngữ nghĩa / theo VAD (tham số semantic_punctuation_enabled)
   - Tự thêm dấu câu, ITN, lọc từ đệm...
5. Giải thích tham số:
   - model: tên mô hình, khuyên dùng paraformer-realtime-v2
   - sample_rate: tần số lấy mẫu (Hz), v2 hỗ trợ mọi tần số, v1 chỉ 16000, bản 8k chỉ 8000
   - semantic_punctuation_enabled: false là ngắt câu theo VAD (độ trễ thấp), true là theo ngữ nghĩa (chính xác hơn)
   - max_sentence_silence: ngưỡng im lặng khi ngắt câu VAD (200-6000ms)
' WHERE `id` = 'ASR_AliyunBLStream' AND `remark` = '阿里百炼Paraformer实时语音识别配置说明：
1. 登录阿里云百炼平台 https://bailian.console.aliyun.com/
2. 创建API-KEY https://bailian.console.aliyun.com/#/api-key
3. 支持模型：paraformer-realtime-v2(推荐)、paraformer-realtime-8k-v2、paraformer-realtime-v1、paraformer-realtime-8k-v1
4. 功能特性：
   - 多语言支持(中文含方言、英文、日语、韩语、德语、法语、俄语)
   - 热词定制(vocabulary_id参数)，详细说明请参考：https://help.aliyun.com/zh/model-studio/custom-hot-words?
   - 语义断句/VAD断句(semantic_punctuation_enabled参数)
   - 自动标点符号、ITN、过滤语气词等
5. 参数说明：
   - model: 模型名称，推荐paraformer-realtime-v2
   - sample_rate: 采样率(Hz)，v2支持任意采样率，v1仅支持16000，8k版本仅支持8000
   - semantic_punctuation_enabled: false为VAD断句(低延迟)，true为语义断句(高准确)
   - max_sentence_silence: VAD断句静音时长阈值(200-6000ms)
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình không nhận diện ý định:
1. Không nhận diện ý định
2. Mọi hội thoại chuyển thẳng cho LLM
3. Không cần cấu hình thêm
4. Phù hợp với hội thoại đơn giản' WHERE `id` = 'Intent_nointent' AND `remark` = '无意图识别配置说明：
1. 不进行意图识别
2. 所有对话直接传递给LLM处理
3. 无需额外配置
4. 适合简单对话场景';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình nhận diện ý định bằng LLM:
1. Dùng một LLM riêng để nhận diện ý định
2. Mặc định dùng mô hình của selected_module.LLM
3. Có thể cấu hình LLM riêng (ví dụ một mô hình miễn phí, nhỏ)
4. Dùng được rộng rãi, nhưng tăng thời gian xử lý
Cấu hình:
1. Chỉ định mô hình LLM ở trường llm
2. Nếu không chỉ định, dùng mô hình của selected_module.LLM' WHERE `id` = 'Intent_intent_llm' AND `remark` = 'LLM意图识别配置说明：
1. 使用独立的LLM进行意图识别
2. 默认使用selected_module.LLM的模型
3. 可以配置使用独立的LLM（如免费的ChatGLMLLM）
4. 通用性强，但会增加处理时间
配置说明：
1. 在llm字段中指定使用的LLM模型
2. 如果不指定，则使用selected_module.LLM的模型';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình nhận diện ý định bằng function call:
1. Dùng tính năng function_call của LLM để nhận diện ý định
2. LLM được chọn cần hỗ trợ function_call
3. Gọi công cụ khi cần, xử lý nhanh' WHERE `id` = 'Intent_function_call' AND `remark` = '函数调用意图识别配置说明：
1. 使用LLM的function_call功能进行意图识别
2. 需要所选择的LLM支持function_call
3. 按需调用工具，处理速度快';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Zhipu AI (GLM):
1. Truy cập https://bigmodel.cn/usercenter/proj-mgmt/apikeys
2. Đăng ký và lấy khóa API
3. Điền vào cấu hình
Lưu ý: máy chủ đặt tại Trung Quốc, truy cập từ Việt Nam có thể chậm.' WHERE `id` = 'LLM_ChatGLMLLM' AND `remark` = 'ChatGLM配置说明：
1. 访问 https://bigmodel.cn/usercenter/proj-mgmt/apikeys
2. 注册并获取API密钥
3. 填入配置文件中';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Ollama:
1. Cài đặt dịch vụ Ollama
2. Chạy lệnh: ollama pull qwen2.5
3. Đảm bảo dịch vụ chạy tại http://localhost:11434' WHERE `id` = 'LLM_OllamaLLM' AND `remark` = 'Ollama配置说明：
1. 安装Ollama服务
2. 运行命令：ollama pull qwen2.5
3. 确保服务运行在http://localhost:11434';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Qwen (Tongyi Qianwen):
1. Truy cập https://bailian.console.aliyun.com/?apiKey=1#/api-key
2. Lấy khóa API
3. Điền vào cấu hình, cấu hình hiện tại dùng mô hình qwen-flash
4. Hỗ trợ tham số tuỳ chỉnh: temperature=0.7, max_tokens=500, top_p=1, top_k=50' WHERE `id` = 'LLM_AliLLM' AND `remark` = '通义千问配置说明：
1. 访问 https://bailian.console.aliyun.com/?apiKey=1#/api-key
2. 获取API密钥
3. 填入配置文件中，当前配置使用qwen-flash模型
4. 支持自定义参数：temperature=0.7, max_tokens=500, top_p=1, top_k=50';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình ứng dụng Aliyun Bailian:
1. Truy cập https://bailian.console.aliyun.com/?apiKey=1#/api-key
2. Lấy app_id và api_key
3. Điền vào cấu hình' WHERE `id` = 'LLM_AliAppLLM' AND `remark` = '通义百炼配置说明：
1. 访问 https://bailian.console.aliyun.com/?apiKey=1#/api-key
2. 获取app_id和api_key
3. 填入配置文件中';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Doubao LLM:
1. Truy cập https://console.volcengine.com/ark/region:ark+cn-beijing/openManagement
2. Bật dịch vụ Doubao-Seed-2.0-Lite
3. Truy cập https://console.volcengine.com/ark/region:ark+cn-beijing/apiKey để lấy khóa API
4. Điền vào cấu hình
5. Hiện khuyên dùng doubao-seed-2-0-lite-260215
Lưu ý: có hạn mức miễn phí 500000 token' WHERE `id` = 'LLM_DoubaoLLM' AND `remark` = '豆包大模型配置说明：
1. 访问 https://console.volcengine.com/ark/region:ark+cn-beijing/openManagement
2. 开通 Doubao-Seed-2.0-Lite 服务
3. 访问 https://console.volcengine.com/ark/region:ark+cn-beijing/apiKey 获取API密钥
4. 填入配置文件中
5. 当前建议使用 doubao-seed-2-0-lite-260215
注意：有免费额度500000token';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình DeepSeek:
1. Truy cập https://platform.deepseek.com/
2. Đăng ký và lấy khóa API
3. Điền vào cấu hình' WHERE `id` = 'LLM_DeepSeekLLM' AND `remark` = 'DeepSeek配置说明：
1. 访问 https://platform.deepseek.com/
2. 注册并获取API密钥
3. 填入配置文件中';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Dify:
1. Truy cập https://cloud.dify.ai/
2. Đăng ký và lấy khóa API
3. Điền vào cấu hình
4. Hỗ trợ nhiều chế độ hội thoại: workflows/run, chat-messages, completion-messages
5. Vai trò đặt trên nền tảng này sẽ không có tác dụng, cần đặt trong bảng điều khiển Dify
Lưu ý: nên dùng Dify tự triển khai' WHERE `id` = 'LLM_DifyLLM' AND `remark` = 'Dify配置说明：
1. 访问 https://cloud.dify.ai/
2. 注册并获取API密钥
3. 填入配置文件中
4. 支持多种对话模式：workflows/run, chat-messages, completion-messages
5. 平台设置的角色定义会失效，需要在Dify控制台设置
注意：建议使用本地部署的Dify接口，国内部分区域访问公有云接口可能受限';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Gemini (SDK gốc):
1. Dùng dịch vụ Google Gemini API
2. Cấu hình hiện tại dùng mô hình gemini-2.5-flash
3. Cần kết nối mạng
4. Hỗ trợ cấu hình proxy
Các bước đăng ký:
1. Truy cập https://aistudio.google.com/apikey
2. Tạo khóa API
3. Điền vào cấu hình
Khuyên dùng "Google Gemini (tương thích OpenAI)" để gọi công cụ ổn định hơn.' WHERE `id` = 'LLM_GeminiLLM' AND `remark` = 'Gemini配置说明：
1. 使用谷歌Gemini API服务
2. 当前配置使用gemini-2.0-flash模型
3. 需要网络连接
4. 支持配置代理
申请步骤：
1. 访问 https://aistudio.google.com/apikey
2. 创建API密钥
3. 填入配置文件中
注意：若在中国境内使用，请遵守《生成式人工智能服务管理暂行办法》';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Coze:
1. Dùng dịch vụ nền tảng Coze
2. Cần bot_id, user_id và token cá nhân
3. Cần kết nối mạng
Các bước đăng ký:
1. Truy cập https://www.coze.cn/open/oauth/pats
2. Lấy token cá nhân
3. Tự xác định bot_id và user_id
4. Điền vào cấu hình' WHERE `id` = 'LLM_CozeLLM' AND `remark` = 'Coze配置说明：
1. 使用Coze平台服务
2. 需要bot_id、user_id和个人令牌
3. 需要网络连接
申请步骤：
1. 访问 https://www.coze.cn/open/oauth/pats
2. 获取个人令牌
3. 手动计算bot_id和user_id
4. 填入配置文件中';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình LM Studio:
1. Dùng dịch vụ LM Studio triển khai cục bộ
2. Cấu hình hiện tại dùng mô hình deepseek-r1-distill-llama-8b@q4_k_m
3. Suy luận cục bộ, không cần mạng
4. Cần tải mô hình trước
Các bước triển khai:
1. Cài đặt LM Studio
2. Tải mô hình từ cộng đồng
3. Đảm bảo dịch vụ chạy tại http://localhost:1234/v1' WHERE `id` = 'LLM_LMStudioLLM' AND `remark` = 'LM Studio配置说明：
1. 使用本地部署的LM Studio服务
2. 当前配置使用deepseek-r1-distill-llama-8b@q4_k_m模型
3. 本地推理，无需网络连接
4. 需要预先下载模型
部署步骤：
1. 安装LM Studio
2. 从社区下载模型
3. 确保服务运行在http://localhost:1234/v1';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình FastGPT:
1. Dùng dịch vụ nền tảng FastGPT
2. Cần kết nối mạng
3. Prompt trong cấu hình không có tác dụng, cần đặt trong bảng điều khiển FastGPT
4. Hỗ trợ biến tuỳ chỉnh
Các bước đăng ký:
1. Truy cập https://cloud.tryfastgpt.ai/account/apikey
2. Lấy khóa API
3. Điền vào cấu hình' WHERE `id` = 'LLM_FastgptLLM' AND `remark` = 'FastGPT配置说明：
1. 使用FastGPT平台服务
2. 需要网络连接
3. 配置文件中的prompt无效，需要在FastGPT控制台设置
4. 支持自定义变量
申请步骤：
1. 访问 https://cloud.tryfastgpt.ai/account/apikey
2. 获取API密钥
3. 填入配置文件中';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Xinference:
1. Dùng dịch vụ Xinference triển khai cục bộ
2. Cấu hình hiện tại dùng mô hình qwen2.5:72b-AWQ
3. Suy luận cục bộ, không cần mạng
4. Cần khởi động mô hình tương ứng trước
Các bước triển khai:
1. Cài đặt Xinference
2. Khởi động dịch vụ và nạp mô hình
3. Đảm bảo dịch vụ chạy tại http://localhost:9997' WHERE `id` = 'LLM_XinferenceLLM' AND `remark` = 'Xinference配置说明：
1. 使用本地部署的Xinference服务
2. 当前配置使用qwen2.5:72b-AWQ模型
3. 本地推理，无需网络连接
4. 需要预先启动对应模型
部署步骤：
1. 安装Xinference
2. 启动服务并加载模型
3. 确保服务运行在http://localhost:9997';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Xinference mô hình nhỏ:
1. Dùng dịch vụ Xinference triển khai cục bộ
2. Cấu hình hiện tại dùng mô hình qwen2.5:3b-AWQ
3. Suy luận cục bộ, không cần mạng
4. Dùng cho nhận diện ý định
Các bước triển khai:
1. Cài đặt Xinference
2. Khởi động dịch vụ và nạp mô hình
3. Đảm bảo dịch vụ chạy tại http://localhost:9997' WHERE `id` = 'LLM_XinferenceSmallLLM' AND `remark` = 'Xinference小模型配置说明：
1. 使用本地部署的Xinference服务
2. 当前配置使用qwen2.5:3b-AWQ模型
3. 本地推理，无需网络连接
4. 用于意图识别
部署步骤：
1. 安装Xinference
2. 启动服务并加载模型
3. 确保服务运行在http://localhost:9997';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình iFlytek Spark:
1. Đăng nhập nền tảng mở iFlytek https://www.xfyun.cn/, mỗi mô hình có một api_password riêng, khi đổi mô hình cần xem api_password tương ứng
2. Tạo ứng dụng Spark để lấy API Password
3. Giải thích tham số:
   - api_password: API Password, có sau khi tạo ứng dụng trên iFlytek
   - model_name: tên mô hình, hỗ trợ generalv3.5, generalv3...
   - base_url: địa chỉ API, mặc định https://spark-api-open.xf-yun.com/v1
   - temperature: nhiệt độ, điều khiển độ ngẫu nhiên, từ 0-1, mặc định 0.5
   - max_tokens: số token đầu ra tối đa, mặc định 2048
   - top_p: tham số lấy mẫu, điều khiển độ đa dạng từ vựng, mặc định 1.0
   - frequency_penalty: phạt tần suất, giảm lặp lại, mặc định 0.0
4. Mỗi mô hình có một api_password riêng, khi đổi mô hình cần xem api_password tương ứng.
' WHERE `id` = 'LLM_XunfeiSparkLLM' AND `remark` = '讯飞星火认知大模型配置说明：
1. 登录讯飞开放平台 https://www.xfyun.cn/，每一个模型对应每一个api_password,更改模型时需要查看对应模型的api_password
2. 创建星火认知大模型应用获取API Password
3. 参数说明：
   - api_password: API Password，在讯飞开放平台创建应用后获得
   - model_name: 模型名称，支持generalv3.5、generalv3等版本
   - base_url: API地址，默认https://spark-api-open.xf-yun.com/v1
   - temperature: 温度参数，控制生成随机性，范围0-1，默认0.5
   - max_tokens: 最大输出token数，默认2048
   - top_p: 核心采样参数，控制词汇多样性，默认1.0
   - frequency_penalty: 频率惩罚，降低重复内容，默认0.0
4. 每一个模型对应每一个api_password,更改模型时需要查看对应模型的api_password。
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Volcengine AI Gateway (LLM):
1. Dùng dịch vụ AI Gateway của Volcengine
2. Cần khóa truy cập gateway
3. Cần kết nối mạng
4. Hỗ trợ function_call
Các bước đăng ký:
1. Truy cập https://console.volcengine.com/vei/aigateway/
2. Tạo khóa truy cập gateway, tìm và chọn Doubao-pro-32k-functioncall
3. Nếu cần tổng hợp giọng nói, chọn thêm Doubao-语音合成
4. Truy cập https://console.volcengine.com/vei/aigateway/tokens-list để lấy khóa
5. Điền vào cấu hình' WHERE `id` = 'LLM_VolcesAiGatewayLLM' AND `remark` = '火山引擎边缘大模型网关LLM配置说明：
1. 使用火山引擎边缘大模型网关服务
2. 需要网关访问密钥
3. 需要网络连接
4. 支持function_call功能
申请步骤：
1. 访问 https://console.volcengine.com/vei/aigateway/
2. 创建网关访问密钥，搜索并勾选 Doubao-pro-32k-functioncall
3. 如果需要使用语音合成，一并勾选 Doubao-语音合成
4. 访问 https://console.volcengine.com/vei/aigateway/tokens-list 获取密钥
5. 填入配置文件中';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình không có bộ nhớ:
1. Không lưu lịch sử hội thoại
2. Mỗi cuộc hội thoại là độc lập
3. Không cần cấu hình thêm
4. Phù hợp khi yêu cầu cao về quyền riêng tư' WHERE `id` = 'Memory_nomem' AND `remark` = '无记忆配置说明：
1. 不保存对话历史
2. 每次对话都是独立的
3. 无需额外配置
4. 适合对隐私要求高的场景';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình bộ nhớ ngắn hạn cục bộ:
1. Lưu lịch sử hội thoại cục bộ
2. Dùng LLM của selected_module để tóm tắt hội thoại
3. Dữ liệu lưu cục bộ, không tải lên máy chủ bên ngoài
4. Phù hợp khi coi trọng quyền riêng tư
5. Không cần cấu hình thêm' WHERE `id` = 'Memory_mem_local_short' AND `remark` = '本地短期记忆配置说明：
1. 使用本地存储保存对话历史
2. 通过selected_module的llm总结对话内容
3. 数据保存在本地，不会上传到服务器
4. 适合注重隐私的场景
5. 无需额外配置';
UPDATE `ai_model_config` SET `remark` = 'Chỉ lưu lịch sử chat, không tóm tắt bộ nhớ' WHERE `id` = 'Memory_mem_report_only' AND `remark` = '仅上报聊天记录，不总结记忆';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình bộ nhớ Mem0AI:
1. Dùng dịch vụ Mem0AI để lưu lịch sử hội thoại
2. Cần khóa API
3. Cần kết nối mạng
4. Miễn phí 1000 lượt gọi mỗi tháng
Các bước đăng ký:
1. Truy cập https://app.mem0.ai/dashboard/api-keys
2. Lấy khóa API
3. Điền vào cấu hình' WHERE `id` = 'Memory_mem0ai' AND `remark` = 'Mem0AI记忆配置说明：
1. 使用Mem0AI服务保存对话历史
2. 需要API密钥
3. 需要网络连接
4. 每月有1000次免费调用
申请步骤：
1. 访问 https://app.mem0.ai/dashboard/api-keys
2. 获取API密钥
3. 填入配置文件中';
UPDATE `ai_model_config` SET `remark` = 'PowerMem là thành phần bộ nhớ tác nhân mã nguồn mở của OceanBase, dùng LLM để tóm tắt bộ nhớ
GitHub: https://github.com/oceanbase/powermem
Trang chủ: https://www.powermem.ai/
Ví dụ sử dụng: https://github.com/oceanbase/powermem/tree/main/examples

【Chi phí】
Bản thân PowerMem miễn phí, chi phí thực tế phụ thuộc vào LLM và cơ sở dữ liệu đã chọn:
- sqlite + LLM miễn phí = hoàn toàn miễn phí
- LLM hoặc cơ sở dữ liệu trên cloud = tính phí theo dịch vụ tương ứng

【enable_user_profile】Hồ sơ người dùng
- false: chế độ bộ nhớ thường (AsyncMemory)
- true: chế độ hồ sơ người dùng (UserMemory), tự trích xuất thông tin người dùng
- Hồ sơ người dùng hỗ trợ: oceanbase, seekdb, sqlite (powermem 0.3.0+)

【llm】Cấu hình LLM - dùng để tóm tắt bộ nhớ và trích xuất hồ sơ người dùng
  provider: nhà cung cấp LLM, có thể chọn:
    - qwen: Qwen (https://bailian.console.aliyun.com/?apiKey=1#/api-key)
    - openai: giao diện tương thích OpenAI (dùng được cho Gemini, OpenAI...)
    - zhipu: Zhipu AI (https://bigmodel.cn/usercenter/proj-mgmt/apikeys)
  config: tham số LLM
    - api_key: khóa API (bắt buộc)
    - model: tên mô hình, ví dụ qwen-plus, glm-4-flash, gemini-2.5-flash
    - openai_base_url: địa chỉ dịch vụ tuỳ chỉnh (không bắt buộc), ví dụ https://api.openai.com/v1
  Ví dụ:
    {"provider": "openai", "config": {"api_key": "your_key", "model": "gemini-2.5-flash", "openai_base_url": "https://generativelanguage.googleapis.com/v1beta/openai/"}}
    {"provider": "qwen", "config": {"api_key": "your_key", "model": "qwen-plus"}}

【embedder】Cấu hình Embedding - dùng để vector hoá nội dung bộ nhớ
  provider: nhà cung cấp mô hình embedding, có thể chọn:
    - qwen: Qwen
    - openai: giao diện tương thích OpenAI
  config: tham số embedding
    - api_key: khóa API (bắt buộc)
    - model: tên mô hình, ví dụ text-embedding-v4, text-embedding-3-small
    - openai_base_url: địa chỉ dịch vụ tuỳ chỉnh (không bắt buộc)
    - embedding_dims: số chiều vector (không bắt buộc), cần cấu hình nếu khác 1536
  Ví dụ:
    {"provider": "openai", "config": {"api_key": "your_key", "model": "text-embedding-3-small", "openai_base_url": "https://api.openai.com/v1"}}

【vector_store】Cấu hình cơ sở dữ liệu - dùng để lưu bộ nhớ đã vector hoá
  provider: loại cơ sở dữ liệu, có thể chọn:
    - sqlite: cơ sở dữ liệu cục bộ gọn nhẹ (khuyên dùng khi mới bắt đầu, không cần cấu hình)
    - oceanbase: OceanBase (khuyên dùng cho môi trường production, hiệu năng tốt nhất)
    - seekdb: SeekDB (khuyên dùng, lưu trữ tích hợp cho ứng dụng AI)
    - postgres: PostgreSQL

  Cấu hình SQLite (không cần cấu hình thêm):
    {"provider": "sqlite", "config": {}}

  Ví dụ cấu hình OceanBase:
    {"provider": "oceanbase", "config": {
      "host": "127.0.0.1",
      "port": 2881,
      "user": "root@test",
      "password": "your_password",
      "db_name": "powermem",
      "collection_name": "memories",
      "embedding_model_dims": 1024
    }}
  Lưu ý:
    - collection_name: tên bảng mặc định, nếu tạo sai số chiều hãy xoá bảng này hoặc đổi tên
    - embedding_model_dims: số chiều vector, phải khớp với mô hình của embedder
      ví dụ Zhipu: embedding-2 là 1024 chiều, embedding-3 là 2048 chiều

【Tổ hợp cấu hình khuyên dùng】
1. Phương án tiết kiệm:
   - LLM: openai + gemini-2.5-flash (có hạn mức miễn phí)
   - Embedder: openai + text-embedding-3-small
   - Database: sqlite

2. Phương án production:
   - LLM: mô hình thương mại
   - Embedder: text-embedding-3-small hoặc text-embedding-v4
   - Database: oceanbase hoặc seekdb
' WHERE `id` = 'Memory_powermem' AND `remark` = 'PowerMem是OceanBase开源的agent记忆组件，通过本地LLM进行记忆总结
GitHub: https://github.com/oceanbase/powermem
官网: https://www.powermem.ai/
使用示例: https://github.com/oceanbase/powermem/tree/main/examples

【费用说明】
PowerMem本身免费，实际费用取决于所选LLM和数据库：
- 使用sqlite + 免费LLM(如glm-4-flash) = 完全免费
- 使用云端LLM或云端数据库 = 按对应服务收费

【enable_user_profile】用户画像功能
- false: 使用普通记忆模式(AsyncMemory)
- true: 使用用户画像模式(UserMemory)，自动提取用户信息
- 用户画像功能支持: oceanbase、seekdb、sqlite (powermem 0.3.0+)

【llm】LLM配置 - 用于记忆总结和用户画像提取
  provider: LLM提供商，可选值：
    - qwen: 通义千问 (https://bailian.console.aliyun.com/?apiKey=1#/api-key)
    - openai: OpenAI兼容接口
    - zhipu: 智谱AI (https://bigmodel.cn/usercenter/proj-mgmt/apikeys) - 推荐使用免费的glm-4-flash
  config: LLM配置参数
    - api_key: API密钥 (必填)
    - model: 模型名称，如 qwen-plus、glm-4-flash 等
    - openai_base_url: 自定义服务地址 (可选)，如 https://api.openai.com/v1
  示例：
    {"provider": "zhipu", "config": {"api_key": "your_key", "model": "glm-4-flash"}}
    {"provider": "qwen", "config": {"api_key": "your_key", "model": "qwen-plus"}}

【embedder】Embedding配置 - 用于向量化记忆内容
  provider: 嵌入模型提供商，可选值：
    - qwen: 通义千问
    - openai: OpenAI兼容接口
  config: Embedding配置参数
    - api_key: API密钥 (必填)
    - model: 模型名称，如 text-embedding-v4、text-embedding-3-small 等
    - openai_base_url: 自定义服务地址 (可选)
    - embedding_dims: 向量维度 (可选)，非1536时需配置
  示例：
    {"provider": "openai", "config": {"api_key": "your_key", "model": "text-embedding-v4", "openai_base_url": "https://dashscope.aliyuncs.com/compatible-mode/v1"}}

【vector_store】数据库存储配置 - 用于存储向量化的记忆
  provider: 数据库类型，可选值：
    - sqlite: 轻量级本地数据库 (推荐入门使用，无需额外配置)
    - oceanbase: OceanBase数据库 (推荐生产使用，最佳性能)
    - seekdb: SeekDB (推荐，AI应用存储一体)
    - postgres: PostgreSQL数据库

  SQLite配置 (无需额外配置):
    {"provider": "sqlite", "config": {}}

  OceanBase配置示例:
    {"provider": "oceanbase", "config": {
      "host": "127.0.0.1",
      "port": 2881,
      "user": "root@test",
      "password": "your_password",
      "db_name": "powermem",
      "collection_name": "memories",
      "embedding_model_dims": 1024
    }}
  注意：
    - collection_name: 默认表名，如创建维度错误请删除此表或更改名称
    - embedding_model_dims: 嵌入向量维度，需与embedder的模型维度匹配
      例如智谱：embedding-2维度是1024，embedding-3维度是2048

【推荐配置组合】
1. 完全免费方案：
   - LLM: zhipu + glm-4-flash (免费)
   - Embedder: 通义千问 text-embedding-v4
   - Database: sqlite

2. 生产环境方案：
   - LLM: qwen-plus 或其他商业模型
   - Embedder: text-embedding-v4
   - Database: oceanbase 或 seekdb
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn triển khai chi tiết: https://github.com/xinnan-tech/xiaozhi-esp32-server/blob/main/docs/ragflow-integration.md
Sau khi triển khai, đăng ký và đăng nhập, bấm vào ảnh đại diện góc trên bên phải để lấy API KEY và địa chỉ API của RAGFlow. Trước khi dùng RAGFlow, hãy thêm mô hình và đặt mô hình mặc định trong Model Provider.' WHERE `id` = 'RAG_RAGFlow' AND `remark` = '详细部署教程参考：https://github.com/xinnan-tech/xiaozhi-esp32-server/blob/main/docs/ragflow-integration.md
部署成功，注冊登录后，点击右上角头像，获得RAGFlow的API KEY和API服务器地址。使用RAGFlow前请在Model Provider中添加模型和设置默认模型。';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình EdgeTTS:
1. Dùng dịch vụ Microsoft Edge TTS
2. Hỗ trợ nhiều ngôn ngữ và giọng, gồm tiếng Việt: vi-VN-HoaiMyNeural (nữ), vi-VN-NamMinhNeural (nam)
3. Miễn phí, không cần đăng ký
4. Cần kết nối mạng
5. Tệp đầu ra lưu trong thư mục tmp/
6. Tốc độ nói: -100~100, 0 là bình thường
7. Âm lượng: 0~100, 50 là bình thường
8. Cao độ: -100~100, 0 là bình thường' WHERE `id` = 'TTS_EdgeTTS' AND `remark` = 'EdgeTTS配置说明：
1. 使用微软Edge TTS服务
2. 支持多种语言和音色
3. 免费使用，无需注册
4. 需要网络连接
5. 输出文件保存在tmp/目录
6. 语速：-100~100，0为正常速度
7. 音量：0~100，50为正常音量
8. 音调：-100~100，0为正常音调';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Volcengine TTS song luồng:
1. Truy cập https://www.volcengine.com/ để đăng ký tài khoản Volcengine
2. Truy cập https://console.volcengine.com/speech/service/10007 để bật mô hình tổng hợp giọng nói và mua giọng
3. Lấy appid và access_token ở cuối trang
4. ID tài nguyên cố định: volc.service_type.10029 (tổng hợp giọng nói và trộn âm)
5. Tái sử dụng kết nối: bật tái sử dụng kết nối WebSocket, mặc định true để giảm chi phí kết nối (lưu ý: khi tái sử dụng, kết nối rảnh lúc thiết bị đang nghe vẫn chiếm số đồng thời)

Tài liệu tham số chi tiết: https://www.volcengine.com/docs/6561/1329505
【audio_params】Cấu hình đầu ra âm thanh - có thể thêm bất kỳ tham số âm thanh nào Volcengine hỗ trợ
  - speech_rate: tốc độ (-50~100), mặc định 0
  - loudness_rate: âm lượng (-50~100), mặc định 0
  - emotion: cảm xúc (chỉ một số giọng hỗ trợ): neutral, happy, sad, angry, fearful, disgusted, surprised
  - emotion_scale: cường độ cảm xúc (1~5), mặc định 4
  Ví dụ: {"speech_rate": 10, "loudness_rate": 5, "emotion": "happy", "emotion_scale": 4}

【additions】Cấu hình xử lý văn bản nâng cao - có thể thêm bất kỳ tham số nâng cao nào Volcengine hỗ trợ
  - post_process.pitch: cao độ (-12~12), mặc định 0
  - aigc_metadata: cấu hình metadata AIGC
  - cache_config: cấu hình bộ nhớ đệm
  Ví dụ: {"post_process": {"pitch": 2}, "aigc_metadata": {}, "cache_config": {}}

【mix_speaker】Cấu hình trộn âm - trộn nhiều giọng (chỉ TTS 1.0)
  Ví dụ:
    {"speakers": [
      {"source_speaker": "zh_male_bvlazysheep","mix_factor": 0.3},
      {"source_speaker": "BV120_streaming","mix_factor": 0.3},
      {"source_speaker": "zh_male_ahu_conversation_wvae_bigtts","mix_factor": 0.4}
    ]}

Lưu ý:
- Tham số cảm xúc (emotion, emotion_scale) chỉ một số giọng hỗ trợ
- Danh sách giọng: https://www.volcengine.com/docs/6561/1257544
- Có thể tự thêm tham số theo tài liệu API của Volcengine
- Trộn âm chủ yếu dùng cho giọng của mô hình Doubao 1.0, khi dùng cần đặt req_params.speaker là custom_mix_bigtts
' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS' AND `remark` = '火山引擎双向流式TTS配置说明：
1. 访问 https://www.volcengine.com/ 注册并开通火山引擎账号
2. 访问 https://console.volcengine.com/speech/service/10007 开通语音合成大模型，购买音色
3. 在页面底部获取appid和access_token
4. 资源ID固定为：volc.service_type.10029（大模型语音合成及混音）
5. 链接复用：开启WebSocket连接复用，默认true减少链接损耗（注意：复用后设备处于聆听状态时空闲链接会占并发数）

详细参数文档：https://www.volcengine.com/docs/6561/1329505
【audio_params】音频输出配置 - 用户可自定义添加火山引擎支持的任何音频参数
  - speech_rate: 语速(-50~100)，默认0
  - loudness_rate: 音量(-50~100)，默认0
  - emotion: 情感类型（仅部分音色支持），可选值：neutral、happy、sad、angry、fearful、disgusted、surprised
  - emotion_scale: 情感强度(1~5)，默认4
  示例：{"speech_rate": 10, "loudness_rate": 5, "emotion": "happy", "emotion_scale": 4}

【additions】高级文本处理配置 - 用户可自定义添加火山引擎支持的任何高级参数
  - post_process.pitch: 音高(-12~12)，默认0
  - aigc_metadata: AIGC元数据配置
  - cache_config: 缓存配置
  示例：{"post_process": {"pitch": 2}, "aigc_metadata": {}, "cache_config": {}}

【mix_speaker】混音控制配置 - 多音色混合（仅 TTS 1.0）
  示例：
    {"speakers": [
      {"source_speaker": "zh_male_bvlazysheep","mix_factor": 0.3}, 
      {"source_speaker": "BV120_streaming","mix_factor": 0.3}, 
      {"source_speaker": "zh_male_ahu_conversation_wvae_bigtts","mix_factor": 0.4}
    ]}

注意：
- 多情感音色参数（emotion、emotion_scale）仅部分音色支持
- 相关音色列表：https://www.volcengine.com/docs/6561/1257544
- 用户可根据火山引擎API文档自行添加更多参数
- 混音功能主要适用于豆包语音合成模型1.0的音色，使用时需要将req_params.speaker设置为custom_mix_bigtts
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Aliyun Bailian TTS (streaming):
1. Khóa API điền DashScope API Key dùng được trong workspace hiện tại
2. Chế độ công khai dùng wss://dashscope.aliyuncs.com/api-ws/v1/inference/
3. Workspace Bắc Kinh (Hoa Bắc 2) điền wss://<WorkspaceId>.cn-beijing.maas.aliyuncs.com/api-ws/v1/inference
4. Workspace Singapore điền wss://<WorkspaceId>.ap-southeast-1.maas.aliyuncs.com/api-ws/v1/inference
5. Thay <WorkspaceId> bằng ID workspace thật; chỉ hỗ trợ địa chỉ WSS chính thức của Aliyun
6. Hỗ trợ tổng hợp streaming CosyVoice và cấu hình âm lượng, tốc độ, cao độ' WHERE `id` = 'TTS_AliBLStreamTTS' AND `remark` = '阿里百炼流式 TTS 配置说明：
1. API密钥填写当前业务空间可用的 DashScope API Key
2. 公有模式可使用 wss://dashscope.aliyuncs.com/api-ws/v1/inference/
3. 华北2（北京）业务空间填写 wss://<WorkspaceId>.cn-beijing.maas.aliyuncs.com/api-ws/v1/inference
4. 新加坡业务空间填写 wss://<WorkspaceId>.ap-southeast-1.maas.aliyuncs.com/api-ws/v1/inference
5. 将 <WorkspaceId> 替换为真实业务空间 ID；仅支持阿里云官方 WSS 推理地址
6. 支持 CosyVoice 流式合成及音量、语速、音调配置';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn iFlytek TTS (streaming):
1. Đăng nhập nền tảng iFlytek https://console.xfyun.cn/app/myapp để tạo ứng dụng
2. Chọn dịch vụ cần dùng để lấy cấu hình API https://console.xfyun.cn/services/uts
3. Mua dịch vụ cho ứng dụng (APPID) cần dùng, ví dụ: tổng hợp siêu nhân hoá https://console.xfyun.cn/services/uts
5. Hỗ trợ truyền song luồng thời gian thực, độ trễ thấp
6. Hỗ trợ khẩu ngữ hoá và điều chỉnh tham số âm thanh. Lưu ý: giọng V5 không hỗ trợ khẩu ngữ hoá
7. Hỗ trợ điều chỉnh âm lượng, tốc độ, cao độ thời gian thực' WHERE `id` = 'TTS_XunFeiStreamTTS' AND `remark` = '讯飞流式TTS说明：
1. 登录讯飞语音技术平台 https://console.xfyun.cn/app/myapp 创建相关应用
2. 选择需要的服务获取api相关配置 https://console.xfyun.cn/services/uts
3. 为需要使用的应用(APPID)购买相关服务 例如：超拟人合成 https://console.xfyun.cn/services/uts
5. 支持实时双流式通信，具有较低的延迟
6. 支持口语化设置和音频参数调整 注意：V5音色不支持相关口语化配置
7. 支持实时调节音量、语速、音调等参数
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Minimax TTS (streaming):
1. Cần đăng ký Minimax API Key trước
2. Cần điền Group ID
3. Hỗ trợ nhiều thiết lập giọng và điều chỉnh tham số âm thanh
4. Hỗ trợ tổng hợp streaming thời gian thực, độ trễ thấp
5. Hỗ trợ từ điển phát âm và trọng số giọng tuỳ chỉnh
6. Tham số ẩn: thiết lập giọng (voice_setting), từ điển phát âm (pronunciation_dict), trọng số giọng (timber_weights)
   - Tốc độ (speed): trong khoảng [0.5,2], mặc định 1.0, càng lớn càng nhanh
   - Âm lượng (vol): trong khoảng (0,10], mặc định 1.0, càng lớn càng to
   - Cao độ (pitch): trong khoảng [-12,12], mặc định 0, phải là số nguyên
   - Cảm xúc (emotion): điều khiển cảm xúc giọng tổng hợp, hỗ trợ 7 giá trị: ["happy", "sad", "angry", "fearful", "disgusted", "surprised", "calm"], chỉ áp dụng cho speech-2.5-hd-preview, speech-2.5-turbo-preview, speech-02-hd, speech-02-turbo, speech-01-turbo, speech-01-hd
   - Bắt buộc điền một trong hai: timbre_weights hoặc voice_id
   - voice_id (ID giọng, điền cùng với weight)
   - weight (trọng số, tối đa trộn 4 giọng, trong khoảng [1,100])
' WHERE `id` = 'TTS_MinimaxStreamTTS' AND `remark` = 'Minimax流式TTS配置说明：
1. 需要先申请Minimax API Key
2. 需要填写Group ID
3. 支持多种音色设置和音频参数调整
4. 支持实时流式合成，具有较低的延迟
5. 支持自定义发音字典和音色权重
6. 隐藏参数配置：声音设定(voice_setting)、发音字典(pronunciation_dict)、音色权重(timber_weights)
   - 语速(speed): 范围[0.5,2]，默认1.0，取值越大语速越快
   - 音量(vol): 范围(0,10]，默认1.0，取值越大音量越高
   - 音调(pitch): 范围[-12,12]，默认0，取值需为整数
   - 情绪(emotion): 控制合成语音的情绪，支持7种值：["happy", "sad", "angry", "fearful", "disgusted", "surprised", "calm"]，该参数仅对 speech-2.5-hd-preview、speech-2.5-turbo-preview、speech-02-hd、speech-02-turbo、speech-01-turbo、speech-01-hd 生效
   - timbre_weights与voice_id二选一必填
   - voice_id(请求的音色id，须和weight参数同步填写)
   - weight(权重，最多支持4种音色混合。范围[1,100])
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Aliyun TTS (streaming):
1. Khác biệt giữa Aliyun TTS và Aliyun TTS (streaming): bản thường tổng hợp một lần, bản streaming tổng hợp thời gian thực
2. Bản streaming có độ trễ thấp hơn, phù hợp cho tương tác giọng nói
3. Cần tạo ứng dụng trên bảng điều khiển Aliyun Intelligent Speech Interaction và lấy thông tin xác thực
4. Hỗ trợ giọng mô hình lớn CosyVoice, âm thanh tự nhiên hơn
5. Hỗ trợ điều chỉnh âm lượng, tốc độ, cao độ thời gian thực
Các bước đăng ký:
1. Truy cập https://nls-portal.console.aliyun.com/ để bật dịch vụ
2. Truy cập https://nls-portal.console.aliyun.com/applist để tạo dự án và lấy appkey
3. Truy cập https://nls-portal.console.aliyun.com/overview để lấy token tạm thời (hoặc cấu hình access_key_id và access_key_secret để tự lấy)
4. Nếu cần quản lý token động, nên cấu hình access_key_id và access_key_secret
5. Có thể chọn máy chủ ở Bắc Kinh, Thượng Hải... để giảm độ trễ
6. Tham số voice hỗ trợ giọng CosyVoice như longxiaochun, longyueyue
Xem thêm tham số tại: https://help.aliyun.com/zh/isi/developer-reference/real-time-speech-synthesis
' WHERE `id` = 'TTS_AliyunStreamTTS' AND `remark` = '阿里云流式TTS配置说明：
1. 阿里云TTS和阿里云(流式)TTS的区别是：阿里云TTS是一次性合成，阿里云(流式)TTS是实时流式合成
2. 流式TTS具有更低的延迟和更好的实时性，适合语音交互场景
3. 需要在阿里云智能语音交互控制台创建应用并获取认证信息
4. 支持CosyVoice大模型音色，音质更加自然
5. 支持实时调节音量、语速、音调等参数
申请步骤：
1. 访问 https://nls-portal.console.aliyun.com/ 开通智能语音交互服务
2. 访问 https://nls-portal.console.aliyun.com/applist 创建项目并获取appkey
3. 访问 https://nls-portal.console.aliyun.com/overview 获取临时token（或配置access_key_id和access_key_secret自动获取）
4. 如需动态token管理，建议配置access_key_id和access_key_secret
5. 可选择北京、上海等不同地域的服务器以优化延迟
6. voice参数支持CosyVoice大模型音色，如longxiaochun、longyueyue等
如需了解更多参数配置，请参考：https://help.aliyun.com/zh/isi/developer-reference/real-time-speech-synthesis
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Index-TTS-vLLM (streaming):
1. Index-TTS-vLLM là dịch vụ suy luận vLLM dựa trên dự án Index-TTS, cung cấp tổng hợp giọng nói streaming
2. Hỗ trợ nhiều giọng, âm thanh tự nhiên, phù hợp nhiều tình huống tương tác
3. Cần triển khai dịch vụ Index-TTS-vLLM trước rồi cấu hình địa chỉ API
4. Hỗ trợ tổng hợp streaming thời gian thực, độ trễ thấp
5. Hỗ trợ giọng tuỳ chỉnh, đăng ký giọng mới trong thư mục assets của dự án
Các bước triển khai:
1. Clone dự án: git clone https://github.com/Ksuriuri/index-tts-vllm.git
2. Cài phụ thuộc: pip install -r requirements.txt
3. Khởi động dịch vụ: python app.py
4. Dịch vụ mặc định chạy tại http://127.0.0.1:11996
5. Nếu cần giọng khác, đăng ký trong thư mục assets của dự án
6. Hỗ trợ nhiều định dạng âm thanh: pcm, wav, mp3...
Xem thêm cấu hình tại: https://github.com/Ksuriuri/index-tts-vllm/blob/master/README.md
' WHERE `id` = 'TTS_IndexStreamTTS' AND `remark` = 'Index-TTS-vLLM流式TTS配置说明：
1. Index-TTS-vLLM是基于Index-TTS项目的vLLM推理服务，提供流式语音合成功能
2. 支持多种音色，音质自然，适合各种语音交互场景
3. 需要先部署Index-TTS-vLLM服务，然后配置API地址
4. 支持实时流式合成，具有较低的延迟
5. 支持自定义音色，可在项目assets文件夹下注册新音色
部署步骤：
1. 克隆项目：git clone https://github.com/Ksuriuri/index-tts-vllm.git
2. 安装依赖：pip install -r requirements.txt
3. 启动服务：python app.py
4. 服务默认运行在 http://127.0.0.1:11996
5. 如需其他音色，可到项目assets文件夹下注册
6. 支持多种音频格式：pcm、wav、mp3等
如需了解更多配置，请参考：https://github.com/Ksuriuri/index-tts-vllm/blob/master/README.md
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình PaddleSpeechTTS:
1. PaddleSpeech là công cụ tổng hợp giọng nói mã nguồn mở của Baidu PaddlePaddle, hỗ trợ triển khai offline và huấn luyện mô hình. Trang PaddlePaddle: https://www.paddlepaddle.org.cn/
2. Hỗ trợ giao thức WebSocket và HTTP, mặc định dùng WebSocket để truyền streaming (tài liệu triển khai: https://github.com/xinnan-tech/xiaozhi-esp32-server/blob/main/docs/paddlespeech-deploy.md).
3. Cần triển khai dịch vụ paddlespeech cục bộ trước, mặc định chạy tại ws://127.0.0.1:8092/paddlespeech/tts/streaming
4. Hỗ trợ tuỳ chỉnh giọng, tốc độ, âm lượng và tần số lấy mẫu.
' WHERE `id` = 'TTS_PaddleSpeechTTS' AND `remark` = 'PaddleSpeechTTS 配置说明：
1. PaddleSpeech 是百度飞桨开源的语音合成工具，支持本地离线部署和模型训练。paddlepaddle百度飞浆框架地址：https://www.paddlepaddle.org.cn/
2. 支持 WebSocket 和 HTTP 协议，默认使用 WebSocket 进行流式传输（参考部署文档：https://github.com/xinnan-tech/xiaozhi-esp32-server/blob/main/docs/paddlespeech-deploy.md）。
3. 使用前要在本地部署 paddlespeech 服务，服务默认运行在 ws://127.0.0.1:8092/paddlespeech/tts/streaming
4. 支持自定义发音人、语速、音量和采样率。
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Doubao TTS:
1. Truy cập https://console.volcengine.com/speech/service/8
2. Cần tạo ứng dụng trên bảng điều khiển Volcengine và lấy appid, access_token
3. Giọng Volcengine cần mua gói trả phí (từ 30 NDT, có 100 kết nối đồng thời). Bản miễn phí chỉ có 2 kết nối đồng thời, hay báo lỗi TTS
4. Sau khi mua dịch vụ và nhận giọng miễn phí, có thể phải chờ khoảng nửa tiếng mới dùng được
5. Điền vào cấu hình' WHERE `id` = 'TTS_DoubaoTTS' AND `remark` = '豆包TTS配置说明：
1. 访问 https://console.volcengine.com/speech/service/8
2. 需要在火山引擎控制台创建应用并获取appid和access_token
3. 山引擎语音一定要购买花钱，起步价30元，就有100并发了。如果用免费的只有2个并发，会经常报tts错误
4. 购买服务后，购买免费的音色后，可能要等半小时左右，才能使用。
5. 填入配置文件中';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Tencent TTS:
1. Cần bật dịch vụ Intelligent Speech Interaction trên Tencent Cloud
2. Hỗ trợ nhiều giọng, cấu hình hiện tại dùng 101001
3. Cần kết nối mạng
4. Tệp đầu ra lưu trong thư mục tmp/
Các bước đăng ký:
1. Truy cập https://console.cloud.tencent.com/cam/capi để lấy khóa
2. Truy cập https://console.cloud.tencent.com/tts/resourcebundle để nhận tài nguyên miễn phí
3. Tạo ứng dụng mới
4. Lấy appid, secret_id và secret_key
5. Điền vào cấu hình
Tham số âm thanh:
- format: định dạng âm thanh, hỗ trợ pcm, wav, mp3
- speed: tốc độ, từ -2~6, mặc định 0
- volume: âm lượng, từ -10~10, mặc định 0' WHERE `id` = 'TTS_TencentTTS' AND `remark` = '腾讯TTS配置说明：
1. 需要在腾讯云平台开通智能语音交互服务
2. 支持多种音色，当前配置使用101001
3. 需要网络连接
4. 输出文件保存在tmp/目录
申请步骤：
1. 访问 https://console.cloud.tencent.com/cam/capi 获取密钥
2. 访问 https://console.cloud.tencent.com/tts/resourcebundle 领取免费资源
3. 创建新应用
4. 获取appid、secret_id和secret_key
5. 填入配置文件中
音频参数：
- format: 音频格式，支持pcm、wav、mp3
- speed: 语速，范围-2~6，默认0
- volume: 音量，范围-10~10，默认0';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Aliyun TTS:
1. Cần bật dịch vụ Intelligent Speech Interaction trên Aliyun
2. Hỗ trợ nhiều giọng, cấu hình hiện tại dùng xiaoyun
3. Cần kết nối mạng
4. Tệp đầu ra lưu trong thư mục tmp/
Các bước đăng ký:
1. Truy cập https://nls-portal.console.aliyun.com/ để bật dịch vụ
2. Truy cập https://nls-portal.console.aliyun.com/applist để lấy appkey
3. Truy cập https://nls-portal.console.aliyun.com/overview để lấy token
4. Điền vào cấu hình
Lưu ý: token là tạm thời, có hiệu lực 24 giờ; dùng lâu dài cần cấu hình access_key_id và access_key_secret' WHERE `id` = 'TTS_AliyunTTS' AND `remark` = '阿里云TTS配置说明：
1. 需要在阿里云平台开通智能语音交互服务
2. 支持多种音色，当前配置使用xiaoyun
3. 需要网络连接
4. 输出文件保存在tmp/目录
申请步骤：
1. 访问 https://nls-portal.console.aliyun.com/ 开通服务
2. 访问 https://nls-portal.console.aliyun.com/applist 获取appkey
3. 访问 https://nls-portal.console.aliyun.com/overview 获取token
4. 填入配置文件中
注意：token是临时的24小时有效，长期使用需要配置access_key_id和access_key_secret';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình OpenAI TTS:
1. Cần lấy khóa API trên nền tảng OpenAI
2. Hỗ trợ nhiều giọng (đọc được tiếng Việt), cấu hình hiện tại dùng onyx
3. Cần kết nối mạng
4. Tệp đầu ra lưu trong thư mục tmp/
Các bước đăng ký:
1. Truy cập https://platform.openai.com/api-keys để lấy khóa API
2. Điền vào cấu hình' WHERE `id` = 'TTS_OpenAITTS' AND `remark` = 'OpenAI TTS配置说明：
1. 需要在OpenAI平台获取API密钥
2. 支持多种音色，当前配置使用onyx
3. 需要网络连接
4. 输出文件保存在tmp/目录
申请步骤：
1. 访问 https://platform.openai.com/api-keys 获取API密钥
2. 填入配置文件中
注意：国内需要使用代理访问';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình SiliconFlow TTS:
1. Truy cập https://cloud.siliconflow.cn/account/ak
2. Đăng ký và lấy khóa API
3. Điền vào cấu hình' WHERE `id` = 'TTS_CosyVoiceSiliconflow' AND `remark` = '硅基流动TTS配置说明：
1. 访问 https://cloud.siliconflow.cn/account/ak
2. 注册并获取API密钥
3. 填入配置文件中';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Coze tổng hợp giọng nói (tiếng Trung):
1. Truy cập https://www.coze.cn/ để đăng ký và đăng nhập
2. Tạo ứng dụng và lấy access_token
3. Chọn ID giọng phù hợp
Tham số âm thanh:
- response_format: định dạng âm thanh, hỗ trợ pcm, wav, mp3
- speed: tốc độ, từ 0.5~2, mặc định 1
- loudness_rate: tăng âm lượng, từ -50~100, mặc định 0' WHERE `id` = 'TTS_CozeCnTTS' AND `remark` = 'Coze中文语音合成配置说明：
1. 访问 https://www.coze.cn/ 注册并登录
2. 创建应用并获取access_token
3. 选择合适的音色ID
音频参数：
- response_format: 音频格式，支持pcm、wav、mp3
- speed: 语速，范围0.5~2，默认1
- loudness_rate: 音量增益，范围-50~100，默认0';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình FishSpeech:
1. Cần triển khai dịch vụ FishSpeech cục bộ
2. Hỗ trợ giọng tuỳ chỉnh
3. Suy luận cục bộ, không cần mạng
4. Tệp đầu ra lưu trong thư mục tmp/
5. Xem hướng dẫn: https://github.com/xinnan-tech/xiaozhi-esp32-server/blob/main/docs/fish-speech-integration.md' WHERE `id` = 'TTS_FishSpeech' AND `remark` = 'FishSpeech配置说明：
1. 需要本地部署FishSpeech服务
2. 支持自定义音色
3. 本地推理，无需网络连接
4. 输出文件保存在tmp/目录
5. 可参照教程https://github.com/xinnan-tech/xiaozhi-esp32-server/blob/main/docs/fish-speech-integration.md';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình mô hình tổng hợp giọng nói Doubao 2.0 (dựa trên seed-tts-2.0 của Volcengine):
1. Truy cập https://www.volcengine.com/ để đăng ký tài khoản Volcengine
2. Truy cập https://console.volcengine.com/speech/service/10035 để bật mô hình tổng hợp giọng nói và mua giọng
3. Lấy appid và access_token ở cuối trang
4. ID tài nguyên cố định: seed-tts-2.0 (mô hình tổng hợp giọng nói Doubao 2.0)
5. Tái sử dụng kết nối: bật tái sử dụng kết nối WebSocket, mặc định true để giảm chi phí kết nối (lưu ý: khi tái sử dụng, kết nối rảnh lúc thiết bị đang nghe vẫn chiếm số đồng thời)

Tài liệu tham số chi tiết: https://www.volcengine.com/docs/6561/1329505
【audio_params】Cấu hình đầu ra âm thanh - có thể thêm bất kỳ tham số âm thanh nào Volcengine hỗ trợ
  - speech_rate: tốc độ (-50~100), mặc định 0
  - loudness_rate: âm lượng (-50~100), mặc định 0
  Ví dụ: {"speech_rate": 10, "loudness_rate": 5}

【additions】Cấu hình xử lý văn bản nâng cao - có thể thêm bất kỳ tham số nâng cao nào Volcengine hỗ trợ
  - post_process.pitch: cao độ (-12~12), mặc định 0
  - aigc_metadata: cấu hình metadata AIGC
  - cache_config: cấu hình bộ nhớ đệm
  Ví dụ: {"post_process": {"pitch": 2}, "aigc_metadata": {}, "cache_config": {}}

Lưu ý:
- Mô hình 2.0 dùng ID tài nguyên seed-tts-2.0, khác với Volcengine TTS song luồng (volc.service_type.10029)
- Danh sách giọng: https://www.volcengine.com/docs/6561/1257544
- Có thể tự thêm tham số theo tài liệu API của Volcengine
' WHERE `id` = 'TTS_HSDSTTS_V2' AND `remark` = '豆包语音合成模型2.0配置说明（基于火山引擎seed-tts-2.0）：
1. 访问 https://www.volcengine.com/ 注册并开通火山引擎账号
2. 访问 https://console.volcengine.com/speech/service/10035 开通语音合成大模型，购买音色
3. 在页面底部获取appid和access_token
4. 资源ID固定为：seed-tts-2.0（豆包语音合成模型2.0）
5. 链接复用：开启WebSocket连接复用，默认true减少链接损耗（注意：复用后设备处于聆听状态时空闲链接会占并发数）

详细参数文档：https://www.volcengine.com/docs/6561/1329505
【audio_params】音频输出配置 - 用户可自定义添加火山引擎支持的任何音频参数
  - speech_rate: 语速(-50~100)，默认0
  - loudness_rate: 音量(-50~100)，默认0
  示例：{"speech_rate": 10, "loudness_rate": 5}

【additions】高级文本处理配置 - 用户可自定义添加火山引擎支持的任何高级参数
  - post_process.pitch: 音高(-12~12)，默认0
  - aigc_metadata: AIGC元数据配置
  - cache_config: 缓存配置
  示例：{"post_process": {"pitch": 2}, "aigc_metadata": {}, "cache_config": {}}

注意：
- 豆包语音合成模型2.0使用seed-tts-2.0资源ID，与火山双流式TTS（volc.service_type.10029）不同
- 相关音色列表：https://www.volcengine.com/docs/6561/1257544
- 用户可根据火山引擎API文档自行添加更多参数
';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình GPT-SoVITS V3:
1. Cần triển khai dịch vụ GPT-SoVITS V3 cục bộ
2. Hỗ trợ nhân bản giọng tuỳ chỉnh
3. Suy luận cục bộ, không cần mạng
4. Tệp đầu ra lưu trong thư mục tmp/' WHERE `id` = 'TTS_GPT_SOVITS_V3' AND `remark` = 'GPT-SoVITS V3配置说明：
1. 需要本地部署GPT-SoVITS V3服务
2. 支持自定义音色克隆
3. 本地推理，无需网络连接
4. 输出文件保存在tmp/目录';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình GPT-SoVITS V2:
1. Cần triển khai dịch vụ GPT-SoVITS cục bộ
2. Hỗ trợ nhân bản giọng tuỳ chỉnh
3. Suy luận cục bộ, không cần mạng
4. Tệp đầu ra lưu trong thư mục tmp/
Các bước triển khai:
1. Lệnh chạy mẫu: python api_v2.py -a 127.0.0.1 -p 9880 -c GPT_SoVITS/configs/demo.yaml' WHERE `id` = 'TTS_GPT_SOVITS_V2' AND `remark` = 'GPT-SoVITS V2配置说明：
1. 需要本地部署GPT-SoVITS服务
2. 支持自定义音色克隆
3. 本地推理，无需网络连接
4. 输出文件保存在tmp/目录
部署步骤：
1. 运行服务示例命令：python api_v2.py -a 127.0.0.1 -p 9880 -c GPT_SoVITS/configs/demo.yaml';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình 302AI TTS:
1. Cần tạo tài khoản trên nền tảng 302 và lấy khóa API
2. Hỗ trợ nhiều giọng, cấu hình hiện tại dùng giọng Wanwan Xiaohe
3. Cần kết nối mạng
4. Tệp đầu ra lưu trong thư mục tmp/
Các bước đăng ký:
1. Truy cập https://dash.302.ai/ để đăng ký tài khoản
2. Truy cập https://dash.302.ai/apis/list để lấy khóa API
3. Điền vào cấu hình
Giá: $35 / 1 triệu ký tự' WHERE `id` = 'TTS_TTS302AI' AND `remark` = '302AI TTS配置说明：
1. 需要在302平台创建账户并获取API密钥
2. 支持多种音色，当前配置使用湾湾小何音色
3. 需要网络连接
4. 输出文件保存在tmp/目录
申请步骤：
1. 访问 https://dash.302.ai/ 注册账号
2. 访问 https://dash.302.ai/apis/list 获取API密钥
3. 填入配置文件中
价格：$35/百万字符';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Volcengine AI Gateway (TTS):
1. Truy cập https://console.volcengine.com/vei/aigateway/
2. Tạo khóa truy cập gateway, tìm và chọn Doubao-语音合成
3. Nếu cần dùng LLM, chọn thêm Doubao-pro-32k-functioncall
4. Truy cập https://console.volcengine.com/vei/aigateway/tokens-list để lấy khóa
5. Điền vào cấu hình
Danh sách giọng: https://www.volcengine.com/docs/6561/1257544' WHERE `id` = 'TTS_VolcesAiGatewayTTS' AND `remark` = '火山引擎边缘大模型网关TTS配置说明：
1. 访问 https://console.volcengine.com/vei/aigateway/
2. 创建网关访问密钥，搜索并勾选 Doubao-语音合成
3. 如果需要使用LLM，一并勾选 Doubao-pro-32k-functioncall
4. 访问 https://console.volcengine.com/vei/aigateway/tokens-list 获取密钥
5. 填入配置文件中
音色列表参考：https://www.volcengine.com/docs/6561/1257544';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình TTS tuỳ chỉnh:
1. Dịch vụ TTS tuỳ chỉnh, tham số yêu cầu có thể tuỳ biến, kết nối được nhiều dịch vụ TTS (ví dụ viXTTS, F5-TTS tiếng Việt)
2. Ví dụ với KokoroTTS triển khai cục bộ
3. Nếu chỉ có CPU: docker run -p 8880:8880 ghcr.io/remsky/kokoro-fastapi-cpu:latest
4. Nếu có GPU: docker run --gpus all -p 8880:8880 ghcr.io/remsky/kokoro-fastapi-gpu:latest
Cấu hình:
1. Cấu hình tham số yêu cầu trong params, định dạng JSON
   Ví dụ KokoroTTS: { "input": "{prompt_text}", "speed": 1, "voice": "zm_yunxi", "stream": true, "download_format": "mp3", "response_format": "mp3", "return_download_link": true }
2. Cấu hình header trong headers
3. Đặt định dạng âm thanh trả về' WHERE `id` = 'TTS_CustomTTS' AND `remark` = '自定义TTS配置说明：
1. 自定义的TTS接口服务，请求参数可自定义，可接入众多TTS服务
2. 以本地部署的KokoroTTS为例
3. 如果只有cpu运行：docker run -p 8880:8880 ghcr.io/remsky/kokoro-fastapi-cpu:latest
4. 如果只有gpu运行：docker run --gpus all -p 8880:8880 ghcr.io/remsky/kokoro-fastapi-gpu:latest
配置说明：
1. 在params中配置请求参数,使用JSON格式
   例如KokoroTTS：{ "input": "{prompt_text}", "speed": 1, "voice": "zm_yunxi", "stream": true, "download_format": "mp3", "response_format": "mp3", "return_download_link": true }
2. 在headers中配置请求头
3. 设置返回音频格式';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình SileroVAD:
1. Dùng mô hình SileroVAD để phát hiện giọng nói
2. Suy luận cục bộ, không cần mạng
3. Cần tải mô hình vào thư mục models/snakers4_silero-vad
4. Tham số có thể cấu hình:
   - threshold: 0.5 (ngưỡng phát hiện giọng nói)
   - min_silence_duration_ms: 700 (thời gian im lặng tối thiểu, đơn vị ms)
5. Nếu người nói hay ngắt quãng lâu, có thể tăng min_silence_duration_ms' WHERE `id` = 'VAD_SileroVAD' AND `remark` = 'SileroVAD配置说明：
1. 使用SileroVAD模型进行语音活动检测
2. 本地推理，无需网络连接
3. 需要下载模型文件到models/snakers4_silero-vad目录
4. 可配置参数：
   - threshold: 0.5（语音检测阈值）
   - min_silence_duration_ms: 700（最小静音持续时间，单位毫秒）
5. 如果说话停顿比较长，可以适当增加min_silence_duration_ms的值';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Zhipu AI thị giác:
1. Truy cập https://bigmodel.cn/usercenter/proj-mgmt/apikeys
2. Đăng ký và lấy khóa API
3. Điền vào cấu hình' WHERE `id` = 'VLLM_ChatGLMVLLM' AND `remark` = '智谱视觉AI配置说明：
1. 访问 https://bigmodel.cn/usercenter/proj-mgmt/apikeys
2. 注册并获取API密钥
3. 填入配置文件中';
UPDATE `ai_model_config` SET `remark` = 'Hướng dẫn cấu hình Qwen thị giác:
1. Truy cập https://bailian.console.aliyun.com/?tab=model#/api-key
2. Đăng ký và lấy khóa API
3. Điền vào cấu hình' WHERE `id` = 'VLLM_QwenVLVLLM' AND `remark` = '千问视觉模型配置说明：
1. 访问 https://bailian.console.aliyun.com/?tab=model#/api-key
2. 注册并获取API密钥
3. 填入配置文件中';

-- 3. 供应器名称
UPDATE `ai_model_provider` SET `name` = 'FunASR nhận dạng giọng nói' WHERE `id` = 'SYSTEM_ASR_FunASR' AND `name` = 'FunASR语音识别';
UPDATE `ai_model_provider` SET `name` = 'SherpaASR nhận dạng giọng nói' WHERE `id` = 'SYSTEM_ASR_SherpaASR' AND `name` = 'SherpaASR语音识别';
UPDATE `ai_model_provider` SET `name` = 'Volcengine nhận dạng giọng nói' WHERE `id` = 'SYSTEM_ASR_DoubaoASR' AND `name` = '火山引擎语音识别';
UPDATE `ai_model_provider` SET `name` = 'Volcengine nhận dạng giọng nói (streaming)' WHERE `id` = 'SYSTEM_ASR_DoubaoStreamASR' AND `name` = '火山引擎语音识别(流式)';
UPDATE `ai_model_provider` SET `name` = 'FunASR Server nhận dạng giọng nói' WHERE `id` = 'SYSTEM_ASR_FunASRServer' AND `name` = 'FunASR服务语音识别';
UPDATE `ai_model_provider` SET `name` = 'Tencent nhận dạng giọng nói' WHERE `id` = 'SYSTEM_ASR_TencentASR' AND `name` = '腾讯语音识别';
UPDATE `ai_model_provider` SET `name` = 'Aliyun nhận dạng giọng nói' WHERE `id` = 'SYSTEM_ASR_AliyunASR' AND `name` = '阿里云语音识别';
UPDATE `ai_model_provider` SET `name` = 'Aliyun nhận dạng giọng nói (streaming)' WHERE `id` = 'SYSTEM_ASR_AliyunStreamASR' AND `name` = '阿里云语音识别(流式)';
UPDATE `ai_model_provider` SET `name` = 'Baidu nhận dạng giọng nói' WHERE `id` = 'SYSTEM_ASR_BaiduASR' AND `name` = '百度语音识别';
UPDATE `ai_model_provider` SET `name` = 'OpenAI nhận dạng giọng nói' WHERE `id` = 'SYSTEM_ASR_OpenaiASR' AND `name` = 'OpenAI语音识别';
UPDATE `ai_model_provider` SET `name` = 'VOSK nhận dạng giọng nói (offline)' WHERE `id` = 'SYSTEM_ASR_VoskASR' AND `name` = 'VOSK离线语音识别';
UPDATE `ai_model_provider` SET `name` = 'Qwen3-ASR-Flash nhận dạng giọng nói' WHERE `id` = 'SYSTEM_ASR_Qwen3Flash' AND `name` = 'Qwen3-ASR-Flash语音识别';
UPDATE `ai_model_provider` SET `name` = 'Aliyun Bailian Paraformer nhận dạng thời gian thực' WHERE `id` = 'SYSTEM_ASR_AliyunBLStream' AND `name` = '阿里百炼Paraformer实时语音识别';
UPDATE `ai_model_provider` SET `name` = 'iFlytek nhận dạng giọng nói (streaming)' WHERE `id` = 'SYSTEM_ASR_XunfeiStream' AND `name` = '讯飞流式语音识别';
UPDATE `ai_model_provider` SET `name` = 'Không nhận diện ý định' WHERE `id` = 'SYSTEM_Intent_nointent' AND `name` = '无意图识别';
UPDATE `ai_model_provider` SET `name` = 'Nhận diện ý định bằng LLM riêng' WHERE `id` = 'SYSTEM_Intent_intent_llm' AND `name` = '外挂的大模型意图识别';
UPDATE `ai_model_provider` SET `name` = 'LLM tự gọi hàm (function call)' WHERE `id` = 'SYSTEM_Intent_function_call' AND `name` = '大模型自主函数调用';
UPDATE `ai_model_provider` SET `name` = 'Giao diện OpenAI' WHERE `id` = 'SYSTEM_LLM_openai' AND `name` = 'OpenAI接口';
UPDATE `ai_model_provider` SET `name` = 'Giao diện Aliyun Bailian' WHERE `id` = 'SYSTEM_LLM_AliBL' AND `name` = '阿里百炼接口';
UPDATE `ai_model_provider` SET `name` = 'Giao diện Ollama' WHERE `id` = 'SYSTEM_LLM_ollama' AND `name` = 'Ollama接口';
UPDATE `ai_model_provider` SET `name` = 'Giao diện Dify' WHERE `id` = 'SYSTEM_LLM_dify' AND `name` = 'Dify接口';
UPDATE `ai_model_provider` SET `name` = 'Giao diện Gemini' WHERE `id` = 'SYSTEM_LLM_gemini' AND `name` = 'Gemini接口';
UPDATE `ai_model_provider` SET `name` = 'Giao diện Coze' WHERE `id` = 'SYSTEM_LLM_coze' AND `name` = 'Coze接口';
UPDATE `ai_model_provider` SET `name` = 'Giao diện FastGPT' WHERE `id` = 'SYSTEM_LLM_fastgpt' AND `name` = 'FastGPT接口';
UPDATE `ai_model_provider` SET `name` = 'Giao diện Xinference' WHERE `id` = 'SYSTEM_LLM_xinference' AND `name` = 'Xinference接口';
UPDATE `ai_model_provider` SET `name` = 'Bộ nhớ Mem0AI' WHERE `id` = 'SYSTEM_Memory_mem0ai' AND `name` = 'Mem0AI记忆';
UPDATE `ai_model_provider` SET `name` = 'Không có bộ nhớ' WHERE `id` = 'SYSTEM_Memory_nomem' AND `name` = '无记忆';
UPDATE `ai_model_provider` SET `name` = 'Bộ nhớ ngắn hạn cục bộ (tóm tắt)' WHERE `id` = 'SYSTEM_Memory_mem_local_short' AND `name` = '本地短期记忆（总结记忆）';
UPDATE `ai_model_provider` SET `name` = 'Bộ nhớ PowerMem' WHERE `id` = 'SYSTEM_Memory_powermem' AND `name` = 'PowerMem记忆';
UPDATE `ai_model_provider` SET `name` = 'Chỉ lưu lịch sử chat (không tóm tắt)' WHERE `id` = 'SYSTEM_Memory_mem_report_only' AND `name` = '仅上报聊天记录（不总结记忆）';
UPDATE `ai_model_provider` SET `name` = 'Tra cứu thời tiết' WHERE `id` = 'SYSTEM_PLUGIN_WEATHER' AND `name` = '天气查询';
UPDATE `ai_model_provider` SET `name` = 'Phát nhạc trên server' WHERE `id` = 'SYSTEM_PLUGIN_MUSIC' AND `name` = '服务器音乐播放';
UPDATE `ai_model_provider` SET `name` = 'Tin tức Chinanews (Trung Quốc)' WHERE `id` = 'SYSTEM_PLUGIN_NEWS_CHINANEWS' AND `name` = '中新网新闻';
UPDATE `ai_model_provider` SET `name` = 'Tổng hợp tin NewsNow (Trung Quốc)' WHERE `id` = 'SYSTEM_PLUGIN_NEWS_NEWSNOW' AND `name` = 'newsnow新闻聚合';
UPDATE `ai_model_provider` SET `name` = 'Điều khiển thiết bị Home Assistant' WHERE `id` = 'SYSTEM_PLUGIN_HA_STATE' AND `name` = 'HomeAssistant设备控制';
UPDATE `ai_model_provider` SET `name` = 'Phát nhạc qua Home Assistant' WHERE `id` = 'SYSTEM_PLUGIN_HA_PLAY_MUSIC' AND `name` = 'HomeAssistant音乐播放';
UPDATE `ai_model_provider` SET `name` = 'Tìm kiếm web' WHERE `id` = 'SYSTEM_PLUGIN_WEB_SEARCH' AND `name` = '联网搜索';
UPDATE `ai_model_provider` SET `name` = 'Gọi giữa các thiết bị' WHERE `id` = 'SYSTEM_PLUGIN_CALL_DEVICE' AND `name` = '设备呼叫设备';
UPDATE `ai_model_provider` SET `name` = 'Volcengine TTS' WHERE `id` = 'SYSTEM_TTS_doubao' AND `name` = '火山引擎TTS';
UPDATE `ai_model_provider` SET `name` = 'SiliconFlow TTS' WHERE `id` = 'SYSTEM_TTS_siliconflow' AND `name` = '硅基流动TTS';
UPDATE `ai_model_provider` SET `name` = 'Tencent tổng hợp giọng nói' WHERE `id` = 'SYSTEM_TTS_TencentTTS' AND `name` = '腾讯语音合成';
UPDATE `ai_model_provider` SET `name` = 'Aliyun TTS' WHERE `id` = 'SYSTEM_TTS_aliyun' AND `name` = '阿里云TTS';
UPDATE `ai_model_provider` SET `name` = 'TTS tuỳ chỉnh' WHERE `id` = 'SYSTEM_TTS_custom' AND `name` = '自定义TTS';
UPDATE `ai_model_provider` SET `name` = 'Volcengine TTS song luồng' WHERE `id` = 'SYSTEM_TTS_HSDSTTS' AND `name` = '火山双流式语音合成';
UPDATE `ai_model_provider` SET `name` = 'Aliyun tổng hợp giọng nói (streaming)' WHERE `id` = 'SYSTEM_TTS_AliyunStreamTTS' AND `name` = '阿里云语音合成(流式)';
UPDATE `ai_model_provider` SET `name` = 'Index-TTS-vLLM (streaming)' WHERE `id` = 'SYSTEM_TTS_IndexStreamTTS' AND `name` = 'Index-TTS-vLLM流式语音合成';
UPDATE `ai_model_provider` SET `name` = 'Minimax tổng hợp giọng nói (streaming)' WHERE `id` = 'SYSTEM_TTS_MinimaxStreamTTS' AND `name` = 'Minimax流式语音合成';
UPDATE `ai_model_provider` SET `name` = 'Aliyun Bailian tổng hợp giọng nói (streaming)' WHERE `id` = 'SYSTEM_TTS_AliBLStreamTTS' AND `name` = '阿里百炼流式语音合成';
UPDATE `ai_model_provider` SET `name` = 'iFlytek tổng hợp giọng nói (streaming)' WHERE `id` = 'SYSTEM_TTS_XunFeiStreamTTS' AND `name` = '讯飞流式语音合成';
UPDATE `ai_model_provider` SET `name` = 'Silero VAD phát hiện giọng nói' WHERE `id` = 'SYSTEM_VAD_SileroVAD' AND `name` = 'SileroVAD语音活动检测';
UPDATE `ai_model_provider` SET `name` = 'Giao diện OpenAI' WHERE `id` = 'SYSTEM_VLLM_openai' AND `name` = 'OpenAI接口';

-- 4. 供应器字段标签
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "应用AppKey"', '"label": "AppKey ứng dụng"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "应用AppKey"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "临时Token"', '"label": "Token tạm thời"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "临时Token"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "输出目录"', '"label": "Thư mục đầu ra"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "输出目录"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "API密钥"', '"label": "Khóa API"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "API密钥"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "模型名称"', '"label": "Tên mô hình"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "模型名称"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "音频格式"', '"label": "Định dạng âm thanh"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "音频格式"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "采样率"', '"label": "Tần số lấy mẫu"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "采样率"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "服务地址"', '"label": "Địa chỉ dịch vụ"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "服务地址"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "断句检测时间"', '"label": "Thời gian phát hiện ngắt câu"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "断句检测时间"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "应用AppID"', '"label": "AppID ứng dụng"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "应用AppID"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "语言参数"', '"label": "Tham số ngôn ngữ"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "语言参数"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "应用ID"', '"label": "ID ứng dụng"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "应用ID"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "访问令牌"', '"label": "Access token"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "访问令牌"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "集群"', '"label": "Cụm (cluster)"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "集群"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "热词文件名称"', '"label": "Tên tệp từ nóng"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "热词文件名称"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "替换词文件名称"', '"label": "Tên tệp từ thay thế"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "替换词文件名称"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "静音判定时长(ms)"', '"label": "Thời gian xác định im lặng (ms)"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "静音判定时长(ms)"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "是否开启多语种识别模式"', '"label": "Bật chế độ nhận dạng đa ngôn ngữ"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "是否开启多语种识别模式"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "指定语言编码"', '"label": "Mã ngôn ngữ chỉ định"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "指定语言编码"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "资源ID"', '"label": "ID tài nguyên"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "资源ID"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "模型目录"', '"label": "Thư mục mô hình"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "模型目录"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "识别语言"', '"label": "Ngôn ngữ nhận dạng"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "识别语言"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "端口号"', '"label": "Cổng"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "端口号"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "服务类型"', '"label": "Loại dịch vụ"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "服务类型"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "是否使用SSL"', '"label": "Dùng SSL"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "是否使用SSL"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "基础URL"', '"label": "URL cơ sở"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "基础URL"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "模型路径"', '"label": "Đường dẫn mô hình"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "模型路径"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "识别领域"', '"label": "Lĩnh vực nhận dạng"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "识别领域"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "方言"', '"label": "Phương ngữ"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "方言"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "动态修正"', '"label": "Hiệu chỉnh động"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "动态修正"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "引用的LLM模型"', '"label": "Mô hình LLM sử dụng"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "引用的LLM模型"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "是否不使用本地prompt"', '"label": "Không dùng prompt cục bộ"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "是否不使用本地prompt"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "记忆ID"', '"label": "ID bộ nhớ"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "记忆ID"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "机器人ID"', '"label": "ID bot"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "机器人ID"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "用户ID"', '"label": "ID người dùng"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "用户ID"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "个人访问令牌"', '"label": "Token truy cập cá nhân"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "个人访问令牌"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "对话模式"', '"label": "Chế độ hội thoại"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "对话模式"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "变量"', '"label": "Biến"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "变量"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "HTTP代理"', '"label": "Proxy HTTP"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "HTTP代理"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "HTTPS代理"', '"label": "Proxy HTTPS"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "HTTPS代理"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "温度"', '"label": "Nhiệt độ (temperature)"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "温度"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "最大令牌数"', '"label": "Số token tối đa"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "最大令牌数"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "top_p值"', '"label": "Giá trị top_p"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "top_p值"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "top_k值"', '"label": "Giá trị top_k"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "top_k值"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "频率惩罚"', '"label": "Phạt tần suất"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "频率惩罚"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "LLM模型"', '"label": "Mô hình LLM"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "LLM模型"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "启用用户画像"', '"label": "Bật hồ sơ người dùng"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "启用用户画像"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "LLM提供商"', '"label": "Nhà cung cấp LLM"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "LLM提供商"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "LLM API密钥"', '"label": "Khóa API LLM"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "LLM API密钥"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "OpenAI基础URL"', '"label": "URL cơ sở OpenAI"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "OpenAI基础URL"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "Embedding提供商"', '"label": "Nhà cung cấp Embedding"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "Embedding提供商"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "Embedding API密钥"', '"label": "Khóa API Embedding"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "Embedding API密钥"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "Embedding模型"', '"label": "Mô hình Embedding"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "Embedding模型"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "Embedding OpenAI基础URL"', '"label": "URL cơ sở OpenAI cho Embedding"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "Embedding OpenAI基础URL"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "Embedding维度"', '"label": "Số chiều Embedding"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "Embedding维度"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "向量存储配置(JSON)"', '"label": "Cấu hình kho vector (JSON)"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "向量存储配置(JSON)"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "HA 服务器地址"', '"label": "Địa chỉ máy chủ Home Assistant"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "HA 服务器地址"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "HA API 访问令牌"', '"label": "Access token API Home Assistant"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "HA API 访问令牌"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "设备列表（名称,实体ID;…）"', '"label": "Danh sách thiết bị (tên,entity_id;…)"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "设备列表（名称,实体ID;…）"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "默认 RSS 源"', '"label": "Nguồn RSS mặc định"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "默认 RSS 源"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "社会新闻 RSS 地址"', '"label": "Địa chỉ RSS tin xã hội"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "社会新闻 RSS 地址"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "国际新闻 RSS 地址"', '"label": "Địa chỉ RSS tin quốc tế"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "国际新闻 RSS 地址"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "财经新闻 RSS 地址"', '"label": "Địa chỉ RSS tin tài chính"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "财经新闻 RSS 地址"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "接口地址"', '"label": "Địa chỉ API"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "接口地址"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "新闻源配置"', '"label": "Cấu hình nguồn tin"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "新闻源配置"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "天气插件 API 密钥"', '"label": "Khóa API plugin thời tiết"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "天气插件 API 密钥"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "默认查询城市"', '"label": "Thành phố mặc định"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "默认查询城市"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "开发者 API Host"', '"label": "API Host của nhà phát triển"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "开发者 API Host"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "搜索源：metaso / tavily / serply"', '"label": "Nguồn tìm kiếm: metaso / tavily / serply"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "搜索源：metaso / tavily / serply"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "工具描述"', '"label": "Mô tả công cụ"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "工具描述"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "返回数量"', '"label": "Số kết quả trả về"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "返回数量"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "WebSocket地址（含Workspace ID）"', '"label": "Địa chỉ WebSocket (kèm Workspace ID)"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "WebSocket地址（含Workspace ID）"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "模型"', '"label": "Mô hình"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "模型"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "音色"', '"label": "Giọng đọc"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "音色"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "音量"', '"label": "Âm lượng"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "音量"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "语速"', '"label": "Tốc độ nói"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "语速"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "音调"', '"label": "Cao độ"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "音调"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "应用密钥"', '"label": "Khóa ứng dụng"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "应用密钥"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "访问密钥ID"', '"label": "Access Key ID"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "访问密钥ID"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "访问密钥密码"', '"label": "Access Key Secret"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "访问密钥密码"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "默认音色"', '"label": "Giọng mặc định"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "默认音色"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "音量增益"', '"label": "Tăng âm lượng"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "音量增益"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "响应格式"', '"label": "Định dạng phản hồi"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "响应格式"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "请求方式"', '"label": "Phương thức yêu cầu"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "请求方式"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "请求参数"', '"label": "Tham số yêu cầu"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "请求参数"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "请求头"', '"label": "Header yêu cầu"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "请求头"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "API地址"', '"label": "Địa chỉ API"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "API地址"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "授权"', '"label": "Xác thực (Authorization)"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "授权"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "音高"', '"label": "Cao độ"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "音高"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "语速(-100~100)"', '"label": "Tốc độ nói (-100~100)"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "语速(-100~100)"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "音量(0~100)"', '"label": "Âm lượng (0~100)"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "音量(0~100)"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "音调(-100~100)"', '"label": "Cao độ (-100~100)"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "音调(-100~100)"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "参考ID"', '"label": "ID tham chiếu"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "参考ID"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "参考音频"', '"label": "Âm thanh tham chiếu"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "参考音频"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "参考文本"', '"label": "Văn bản tham chiếu"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "参考文本"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "是否标准化"', '"label": "Chuẩn hoá"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "是否标准化"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "最大新令牌数"', '"label": "Số token mới tối đa"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "最大新令牌数"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "块长度"', '"label": "Độ dài khối"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "块长度"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "重复惩罚"', '"label": "Phạt lặp lại"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "重复惩罚"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "是否流式"', '"label": "Streaming"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "是否流式"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "是否使用内存缓存"', '"label": "Dùng bộ nhớ đệm"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "是否使用内存缓存"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "种子"', '"label": "Seed"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "种子"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "通道数"', '"label": "Số kênh"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "通道数"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "文本语言"', '"label": "Ngôn ngữ văn bản"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "文本语言"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "参考音频路径"', '"label": "Đường dẫn âm thanh tham chiếu"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "参考音频路径"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "提示文本"', '"label": "Văn bản gợi ý"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "提示文本"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "提示语言"', '"label": "Ngôn ngữ gợi ý"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "提示语言"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "文本分割方法"', '"label": "Cách tách văn bản"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "文本分割方法"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "批处理大小"', '"label": "Kích thước batch"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "批处理大小"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "批处理阈值"', '"label": "Ngưỡng batch"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "批处理阈值"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "是否分桶"', '"label": "Chia bucket"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "是否分桶"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "是否返回片段"', '"label": "Trả về từng đoạn"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "是否返回片段"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "速度因子"', '"label": "Hệ số tốc độ"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "速度因子"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "是否流式模式"', '"label": "Chế độ streaming"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "是否流式模式"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "是否并行推理"', '"label": "Suy luận song song"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "是否并行推理"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "辅助参考音频路径"', '"label": "Đường dẫn âm thanh tham chiếu phụ"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "辅助参考音频路径"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "切分标点"', '"label": "Dấu câu dùng để tách"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "切分标点"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "速度"', '"label": "Tốc độ"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "速度"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "输入参考"', '"label": "Tham chiếu đầu vào"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "输入参考"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "采样步数"', '"label": "Số bước lấy mẫu"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "采样步数"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "是否使用SR"', '"label": "Dùng SR (siêu phân giải)"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "是否使用SR"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "WebSocket地址"', '"label": "Địa chỉ WebSocket"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "WebSocket地址"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "是否开启链接复用"', '"label": "Tái sử dụng kết nối"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "是否开启链接复用"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "音频输出配置"', '"label": "Cấu hình đầu ra âm thanh"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "音频输出配置"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "高级文本处理配置"', '"label": "Cấu hình xử lý văn bản nâng cao"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "高级文本处理配置"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "混音控制配置"', '"label": "Cấu hình trộn âm"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "混音控制配置"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "API服务地址"', '"label": "Địa chỉ dịch vụ API"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "API服务地址"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "组ID"', '"label": "ID nhóm"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "组ID"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "音色ID"', '"label": "ID giọng đọc"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "音色ID"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "音色设置"', '"label": "Thiết lập giọng đọc"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "音色设置"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "发音字典"', '"label": "Từ điển phát âm"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "发音字典"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "音频设置"', '"label": "Thiết lập âm thanh"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "音频设置"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "音色权重"', '"label": "Trọng số giọng đọc"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "音色权重"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "协议类型"', '"label": "Loại giao thức"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "协议类型"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "保存路径"', '"label": "Đường dẫn lưu"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "保存路径"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "区域"', '"label": "Khu vực (region)"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "区域"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "口语化等级"', '"label": "Mức độ khẩu ngữ"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "口语化等级"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "是否口语化"', '"label": "Khẩu ngữ hoá"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "是否口语化"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "服务端拆句"', '"label": "Tách câu phía server"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "服务端拆句"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "保留书面语"', '"label": "Giữ văn viết"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "保留书面语"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "检测阈值"', '"label": "Ngưỡng phát hiện"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "检测阈值"') > 0;
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"label": "最小静音时长"', '"label": "Thời gian im lặng tối thiểu"') AS JSON) WHERE INSTR(CAST(`fields` AS CHAR), '"label": "最小静音时长"') > 0;
-- 联网搜索工具描述默认值
UPDATE `ai_model_provider` SET `fields` = CAST(REPLACE(CAST(`fields` AS CHAR), '"default": "联网搜索工具。当用户明确需要联网搜索问题时使用此工具。"', '"default": "Công cụ tìm kiếm web. Dùng khi người dùng cần tra cứu thông tin trên mạng."') AS JSON) WHERE `id` = 'SYSTEM_PLUGIN_WEB_SEARCH' AND INSTR(CAST(`fields` AS CHAR), '"default": "联网搜索工具。当用户明确需要联网搜索问题时使用此工具。"') > 0;

-- 5. 音色名称与语言（加宽字段以容纳越南语名称）
ALTER TABLE `ai_tts_voice` MODIFY COLUMN `name` VARCHAR(100) COMMENT '音色名称';
ALTER TABLE `ai_tts_voice` MODIFY COLUMN `languages` VARCHAR(100) COMMENT '语言';
UPDATE `ai_tts_voice` SET `name` = 'Long Xiaochun - Nữ tri thức, tích cực' WHERE `id` = 'TTS_AliBLStreamTTS_0001' AND `name` = '龙小淳-知性积极女';
UPDATE `ai_tts_voice` SET `name` = 'Long Xiaoxia - Nữ điềm tĩnh, uy tín' WHERE `id` = 'TTS_AliBLStreamTTS_0002' AND `name` = '龙小夏-沉稳权威女';
UPDATE `ai_tts_voice` SET `name` = 'Long Anran - Nữ hoạt bát' WHERE `id` = 'TTS_AliBLStreamTTS_0003' AND `name` = '龙安燃-活泼质感女';
UPDATE `ai_tts_voice` SET `name` = 'Long Anxuan - Nữ livestream' WHERE `id` = 'TTS_AliBLStreamTTS_0004' AND `name` = '龙安宣-经典直播女';
UPDATE `ai_tts_voice` SET `name` = 'Long Han - Nam ấm áp, si tình' WHERE `id` = 'TTS_AliBLStreamTTS_0005' AND `name` = '龙寒-温暖痴情男';
UPDATE `ai_tts_voice` SET `name` = 'Long Yan - Nữ ấm áp' WHERE `id` = 'TTS_AliBLStreamTTS_0006' AND `name` = '龙颜-温暖春风女';
UPDATE `ai_tts_voice` SET `name` = 'Long Feifei - Nữ ngọt ngào, nhõng nhẽo' WHERE `id` = 'TTS_AliBLStreamTTS_0007' AND `name` = '龙菲菲-甜美矫情女';
UPDATE `ai_tts_voice` SET `name` = 'Long Laotie - Nam Đông Bắc thẳng thắn' WHERE `id` = 'TTS_AliBLStreamTTS_0008' AND `name` = '龙老铁-东北直率男';
UPDATE `ai_tts_voice` SET `name` = 'Long Jiayi - Nữ tiếng Quảng Đông' WHERE `id` = 'TTS_AliBLStreamTTS_0009' AND `name` = '龙嘉怡-知性粤语女';
UPDATE `ai_tts_voice` SET `name` = 'Long Jielidou - Nam vui tươi, tinh nghịch' WHERE `id` = 'TTS_AliBLStreamTTS_0010' AND `name` = '龙杰力豆-阳光顽皮男';
UPDATE `ai_tts_voice` SET `name` = 'Long Ling - Nữ ngây thơ' WHERE `id` = 'TTS_AliBLStreamTTS_0011' AND `name` = '龙铃-稚气呆板女';
UPDATE `ai_tts_voice` SET `name` = 'Lý Bạch - Nam thi tiên cổ đại' WHERE `id` = 'TTS_AliBLStreamTTS_0012' AND `name` = '李白-古代诗仙男';
UPDATE `ai_tts_voice` SET `name` = 'Loong Eva - Nữ tiếng Anh tri thức' WHERE `id` = 'TTS_AliBLStreamTTS_0013' AND `name` = 'loongeva-知性英文女';
UPDATE `ai_tts_voice` SET `name` = 'Loong Brian - Nam tiếng Anh điềm tĩnh' WHERE `id` = 'TTS_AliBLStreamTTS_0014' AND `name` = 'loongbrian-沉稳英文男';
UPDATE `ai_tts_voice` SET `name` = 'Loong Kyong - Nữ tiếng Hàn' WHERE `id` = 'TTS_AliBLStreamTTS_0015' AND `name` = 'loongkyong-韩语女';
UPDATE `ai_tts_voice` SET `name` = 'Loong Tomoka - Nữ tiếng Nhật' WHERE `id` = 'TTS_AliBLStreamTTS_0016' AND `name` = 'loongtomoka-日语女';
UPDATE `ai_tts_voice` SET `name` = 'Loong Tomoya - Nam tiếng Nhật' WHERE `id` = 'TTS_AliBLStreamTTS_0017' AND `name` = 'loongtomoya-日语男';
UPDATE `ai_tts_voice` SET `name` = 'Long Xiaochun - Chị gái dịu dàng' WHERE `id` = 'TTS_AliyunStreamTTS_0001' AND `name` = '龙小淳-温柔姐姐';
UPDATE `ai_tts_voice` SET `name` = 'Long Xiaoxia - Nữ dịu dàng' WHERE `id` = 'TTS_AliyunStreamTTS_0002' AND `name` = '龙小夏-温柔女声';
UPDATE `ai_tts_voice` SET `name` = 'Long Mei - Nữ dịu dàng' WHERE `id` = 'TTS_AliyunStreamTTS_0003' AND `name` = '龙玫-温柔女声';
UPDATE `ai_tts_voice` SET `name` = 'Long Gui - Nữ dịu dàng' WHERE `id` = 'TTS_AliyunStreamTTS_0004' AND `name` = '龙瑰-温柔女声';
UPDATE `ai_tts_voice` SET `name` = 'Long Yu - Nữ trưởng thành' WHERE `id` = 'TTS_AliyunStreamTTS_0005' AND `name` = '龙玉-御姐女声';
UPDATE `ai_tts_voice` SET `name` = 'Long Jiao - Nữ trưởng thành' WHERE `id` = 'TTS_AliyunStreamTTS_0006' AND `name` = '龙娇-御姐女声';
UPDATE `ai_tts_voice` SET `name` = 'Long Chen - Nam lồng tiếng phim' WHERE `id` = 'TTS_AliyunStreamTTS_0007' AND `name` = '龙臣-译制片男声';
UPDATE `ai_tts_voice` SET `name` = 'Long Xiu - Nam thanh niên' WHERE `id` = 'TTS_AliyunStreamTTS_0008' AND `name` = '龙修-青年男声';
UPDATE `ai_tts_voice` SET `name` = 'Long Cheng - Nam tươi sáng' WHERE `id` = 'TTS_AliyunStreamTTS_0009' AND `name` = '龙橙-阳光男声';
UPDATE `ai_tts_voice` SET `name` = 'Long Zhe - Nam trưởng thành' WHERE `id` = 'TTS_AliyunStreamTTS_0010' AND `name` = '龙哲-成熟男声';
UPDATE `ai_tts_voice` SET `name` = 'Bella 2.0 - Nữ đọc tin' WHERE `id` = 'TTS_AliyunStreamTTS_0011' AND `name` = 'Bella2.0-新闻女声';
UPDATE `ai_tts_voice` SET `name` = 'Stella 2.0 - Nữ mạnh mẽ' WHERE `id` = 'TTS_AliyunStreamTTS_0012' AND `name` = 'Stella2.0-飒爽女声';
UPDATE `ai_tts_voice` SET `name` = 'Long Shu - Nam đọc tin' WHERE `id` = 'TTS_AliyunStreamTTS_0013' AND `name` = '龙书-新闻男声';
UPDATE `ai_tts_voice` SET `name` = 'Long Jing - Nữ nghiêm túc' WHERE `id` = 'TTS_AliyunStreamTTS_0014' AND `name` = '龙婧-严肃女声';
UPDATE `ai_tts_voice` SET `name` = 'Long Qi - Giọng trẻ em hoạt bát' WHERE `id` = 'TTS_AliyunStreamTTS_0015' AND `name` = '龙奇-活泼童声';
UPDATE `ai_tts_voice` SET `name` = 'Long Hua - Bé gái hoạt bát' WHERE `id` = 'TTS_AliyunStreamTTS_0016' AND `name` = '龙华-活泼女童';
UPDATE `ai_tts_voice` SET `name` = 'Long Wu - Nam hài hước' WHERE `id` = 'TTS_AliyunStreamTTS_0017' AND `name` = '龙无-无厘头男声';
UPDATE `ai_tts_voice` SET `name` = 'Long Dachui - Nam hài hước' WHERE `id` = 'TTS_AliyunStreamTTS_0018' AND `name` = '龙大锤-幽默男声';
UPDATE `ai_tts_voice` SET `name` = 'Long Jiayi - Nữ tiếng Quảng Đông' WHERE `id` = 'TTS_AliyunStreamTTS_0019' AND `name` = '龙嘉怡-粤语女声';
UPDATE `ai_tts_voice` SET `name` = 'Long Tao - Nữ tiếng Quảng Đông' WHERE `id` = 'TTS_AliyunStreamTTS_0020' AND `name` = '龙桃-粤语女声';
UPDATE `ai_tts_voice` SET `name` = 'Aliyun Xiaoyun' WHERE `id` = 'TTS_AliyunTTS0001' AND `name` = '阿里云小云';
UPDATE `ai_tts_voice` SET `name` = 'CosyVoice Nam' WHERE `id` = 'TTS_CosyVoiceSiliconflow0001' AND `name` = 'CosyVoice男声';
UPDATE `ai_tts_voice` SET `name` = 'CosyVoice Nữ' WHERE `id` = 'TTS_CosyVoiceSiliconflow0002' AND `name` = 'CosyVoice女声';
UPDATE `ai_tts_voice` SET `name` = 'Giọng Coze' WHERE `id` = 'TTS_CozeCnTTS0001' AND `name` = 'CozeCn音色';
UPDATE `ai_tts_voice` SET `name` = 'Nam phổ thông' WHERE `id` = 'TTS_DoubaoTTS0002' AND `name` = '通用男声';
UPDATE `ai_tts_voice` SET `name` = 'Nữ phổ thông' WHERE `id` = 'TTS_DoubaoTTS0001' AND `name` = '通用女声';
UPDATE `ai_tts_voice` SET `name` = 'Nam tươi sáng' WHERE `id` = 'TTS_DoubaoTTS0003' AND `name` = '阳光男生';
UPDATE `ai_tts_voice` SET `name` = 'Bé con đáng yêu' WHERE `id` = 'TTS_DoubaoTTS0004' AND `name` = '奶气萌娃';
UPDATE `ai_tts_voice` SET `name` = 'Wanwan Xiaohe (giọng Đài Loan)' WHERE `id` = 'TTS_DoubaoTTS0005' AND `name` = '湾湾小何';
UPDATE `ai_tts_voice` SET `name` = 'EdgeTTS Nam - Wanlung (Hồng Kông)' WHERE `id` = 'TTS_EdgeTTS0011' AND `name` = 'EdgeTTS男声-香港万龙';
UPDATE `ai_tts_voice` SET `name` = 'EdgeTTS Nữ - Hiumaan (Hồng Kông)' WHERE `id` = 'TTS_EdgeTTS0010' AND `name` = 'EdgeTTS女声-香港海曼';
UPDATE `ai_tts_voice` SET `name` = 'EdgeTTS Nữ - Hiugaai (Hồng Kông)' WHERE `id` = 'TTS_EdgeTTS0009' AND `name` = 'EdgeTTS女声-香港海佳';
UPDATE `ai_tts_voice` SET `name` = 'EdgeTTS Nam - Yunjian' WHERE `id` = 'TTS_EdgeTTS0004' AND `name` = 'EdgeTTS男声-云健';
UPDATE `ai_tts_voice` SET `name` = 'EdgeTTS Nữ - Xiaoni (Thiểm Tây)' WHERE `id` = 'TTS_EdgeTTS0008' AND `name` = 'EdgeTTS女声-陕西小妮';
UPDATE `ai_tts_voice` SET `name` = 'EdgeTTS Nữ - Xiaobei (Liêu Ninh)' WHERE `id` = 'TTS_EdgeTTS0007' AND `name` = 'EdgeTTS女声-辽宁小贝';
UPDATE `ai_tts_voice` SET `name` = 'EdgeTTS Nam - Yunxi' WHERE `id` = 'TTS_EdgeTTS0005' AND `name` = 'EdgeTTS男声-云希';
UPDATE `ai_tts_voice` SET `name` = 'EdgeTTS Nam - Yunxia' WHERE `id` = 'TTS_EdgeTTS0006' AND `name` = 'EdgeTTS男声-云夏';
UPDATE `ai_tts_voice` SET `name` = 'EdgeTTS Nữ - Xiaoxiao' WHERE `id` = 'TTS_EdgeTTS0001' AND `name` = 'EdgeTTS女声-晓晓';
UPDATE `ai_tts_voice` SET `name` = 'EdgeTTS Nữ - Xiaoyi' WHERE `id` = 'TTS_EdgeTTS0003' AND `name` = 'EdgeTTS女声-晓伊';
UPDATE `ai_tts_voice` SET `name` = 'EdgeTTS Nam - Yunyang' WHERE `id` = 'TTS_EdgeTTS0002' AND `name` = 'EdgeTTS男声-云扬';
UPDATE `ai_tts_voice` SET `name` = 'Wanwan Xiaohe (giọng Đài Loan)' WHERE `id` = 'TTS_HSDSTTS_V2_0001' AND `name` = '湾湾小何';
UPDATE `ai_tts_voice` SET `name` = 'Cô gái đáng yêu' WHERE `id` = 'TTS_HSDSTTS_V2_0003' AND `name` = '可爱女生';
UPDATE `ai_tts_voice` SET `name` = 'Công chúa tinh nghịch' WHERE `id` = 'TTS_HSDSTTS_V2_0004' AND `name` = '调皮公主';
UPDATE `ai_tts_voice` SET `name` = 'Thanh niên tươi sáng' WHERE `id` = 'TTS_HSDSTTS_V2_0005' AND `name` = '阳光青年';
UPDATE `ai_tts_voice` SET `name` = 'Thiếu niên sảng khoái' WHERE `id` = 'TTS_HSDSTTS_V2_0006' AND `name` = '爽朗少年';
UPDATE `ai_tts_voice` SET `name` = 'Thiếu niên sảng khoái (bạn cùng bàn)' WHERE `id` = 'TTS_HSDSTTS_V2_0007' AND `name` = '爽朗少年';
UPDATE `ai_tts_voice` SET `name` = 'Dayi' WHERE `id` = 'TTS_HSDSTTS_V2_0008' AND `name` = '大壹';
UPDATE `ai_tts_voice` SET `name` = 'Mizai - Thám tử mèo đen' WHERE `id` = 'TTS_HSDSTTS_V2_0009' AND `name` = '黑猫侦探社咪仔';
UPDATE `ai_tts_voice` SET `name` = 'Nữ truyền cảm hứng' WHERE `id` = 'TTS_HSDSTTS_V2_0010' AND `name` = '鸡汤女';
UPDATE `ai_tts_voice` SET `name` = 'Bạn gái quyến rũ' WHERE `id` = 'TTS_HSDSTTS_V2_0011' AND `name` = '魅力女友';
UPDATE `ai_tts_voice` SET `name` = 'Nữ trôi chảy' WHERE `id` = 'TTS_HSDSTTS_V2_0012' AND `name` = '流畅女声';
UPDATE `ai_tts_voice` SET `name` = 'Ruya Yichen - Nam nho nhã' WHERE `id` = 'TTS_HSDSTTS_V2_0013' AND `name` = '儒雅逸辰';
UPDATE `ai_tts_voice` SET `name` = 'Yunzhou' WHERE `id` = 'TTS_HSDSTTS_V2_0014' AND `name` = '云舟';
UPDATE `ai_tts_voice` SET `name` = 'Xiaotian' WHERE `id` = 'TTS_HSDSTTS_V2_0015' AND `name` = '小天';
UPDATE `ai_tts_voice` SET `name` = 'Liu Fei' WHERE `id` = 'TTS_HSDSTTS_V2_0016' AND `name` = '刘飞';
UPDATE `ai_tts_voice` SET `name` = 'Sophie quyến rũ' WHERE `id` = 'TTS_HSDSTTS_V2_0017' AND `name` = '魅力苏菲';
UPDATE `ai_tts_voice` SET `name` = 'Nữ trong trẻo' WHERE `id` = 'TTS_HSDSTTS_V2_0018' AND `name` = '清新女声';
UPDATE `ai_tts_voice` SET `name` = 'Cancan tri thức' WHERE `id` = 'TTS_HSDSTTS_V2_0019' AND `name` = '知性灿灿';
UPDATE `ai_tts_voice` SET `name` = 'Em khoá dưới nũng nịu' WHERE `id` = 'TTS_HSDSTTS_V2_0020' AND `name` = '撒娇学妹';
UPDATE `ai_tts_voice` SET `name` = 'Xiaoyuan ngọt ngào' WHERE `id` = 'TTS_HSDSTTS_V2_0021' AND `name` = '甜美小源';
UPDATE `ai_tts_voice` SET `name` = 'Taozi ngọt ngào' WHERE `id` = 'TTS_HSDSTTS_V2_0022' AND `name` = '甜美桃子';
UPDATE `ai_tts_voice` SET `name` = 'Cô gái nhà bên' WHERE `id` = 'TTS_HSDSTTS_V2_0023' AND `name` = '邻家女孩';
UPDATE `ai_tts_voice` SET `name` = 'Sisi sảng khoái' WHERE `id` = 'TTS_HSDSTTS_V2_0024' AND `name` = '爽快思思';
UPDATE `ai_tts_voice` SET `name` = 'Thiếu niên Zixin / Brayan' WHERE `id` = 'TTS_HSDSTTS_V2_0025' AND `name` = '少年梓辛/Brayan';
UPDATE `ai_tts_voice` SET `name` = 'Ahu ấm áp / Alvin' WHERE `id` = 'TTS_HSDSTTS_V2_0026' AND `name` = '温暖阿虎/Alvin';
UPDATE `ai_tts_voice` SET `name` = 'Bé con đáng yêu' WHERE `id` = 'TTS_HSDSTTS_V2_0027' AND `name` = '奶气萌娃';
UPDATE `ai_tts_voice` SET `name` = 'Bà cụ' WHERE `id` = 'TTS_HSDSTTS_V2_0028' AND `name` = '婆婆';
UPDATE `ai_tts_voice` SET `name` = 'Duoduo nhẹ nhàng' WHERE `id` = 'TTS_HSDSTTS_V2_0029' AND `name` = '轻盈朵朵';
UPDATE `ai_tts_voice` SET `name` = 'Shanshan dịu dàng' WHERE `id` = 'TTS_HSDSTTS_V2_0030' AND `name` = '温婉珊珊';
UPDATE `ai_tts_voice` SET `name` = 'Nữ cổ trang' WHERE `id` = 'TTS_HSDSTTS_V2_0034' AND `name` = '古风少御';
UPDATE `ai_tts_voice` SET `name` = 'Chú trung niên mạnh mẽ' WHERE `id` = 'TTS_HSDSTTS_V2_0035' AND `name` = '霸气青叔';
UPDATE `ai_tts_voice` SET `name` = 'Thuyết minh trinh thám' WHERE `id` = 'TTS_HSDSTTS_V2_0036' AND `name` = '悬疑解说';
UPDATE `ai_tts_voice` SET `name` = 'Heo Peppa' WHERE `id` = 'TTS_HSDSTTS_V2_0037' AND `name` = '佩奇猪';
UPDATE `ai_tts_voice` SET `name` = 'Tôn Ngộ Không' WHERE `id` = 'TTS_HSDSTTS_V2_0038' AND `name` = '猴哥';
UPDATE `ai_tts_voice` SET `name` = 'Trư Bát Giới' WHERE `id` = 'TTS_HSDSTTS_V2_0039' AND `name` = '猪八戒';
UPDATE `ai_tts_voice` SET `name` = 'Đường Tăng' WHERE `id` = 'TTS_HSDSTTS_V2_0040' AND `name` = '唐僧';
UPDATE `ai_tts_voice` SET `name` = 'Sisi sảng khoái / Skye' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0001' AND `name` = '爽快思思/Skye';
UPDATE `ai_tts_voice` SET `name` = 'Ahu ấm áp / Alvin' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0002' AND `name` = '温暖阿虎/Alvin';
UPDATE `ai_tts_voice` SET `name` = 'Thiếu niên Zixin / Brayan' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0003' AND `name` = '少年梓辛/Brayan';
UPDATE `ai_tts_voice` SET `name` = 'Cô gái nhà bên' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0004' AND `name` = '邻家女孩';
UPDATE `ai_tts_voice` SET `name` = 'Chú uyên bác' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0005' AND `name` = '渊博小叔';
UPDATE `ai_tts_voice` SET `name` = 'Thanh niên tươi sáng' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0006' AND `name` = '阳光青年';
UPDATE `ai_tts_voice` SET `name` = 'Ông Bắc Kinh hóm hỉnh / Harmony' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0007' AND `name` = '京腔侃爷/Harmony';
UPDATE `ai_tts_voice` SET `name` = 'Wanwan Xiaohe (giọng Đài Loan)' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0008' AND `name` = '湾湾小何';
UPDATE `ai_tts_voice` SET `name` = 'Chú vùng Vịnh' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0009' AND `name` = '湾区大叔';
UPDATE `ai_tts_voice` SET `name` = 'Cô gái Tứ Xuyên ngộ nghĩnh' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0010' AND `name` = '呆萌川妹';
UPDATE `ai_tts_voice` SET `name` = 'Anh De Quảng Châu' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0011' AND `name` = '广州德哥';
UPDATE `ai_tts_voice` SET `name` = 'Cậu ấm Bắc Kinh' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0012' AND `name` = '北京小爷';
UPDATE `ai_tts_voice` SET `name` = 'Anh Haoyu' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0013' AND `name` = '浩宇小哥';
UPDATE `ai_tts_voice` SET `name` = 'Yuanzhou Quảng Tây' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0014' AND `name` = '广西远舟';
UPDATE `ai_tts_voice` SET `name` = 'Jie''er Hồ Nam' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0015' AND `name` = '妹坨洁儿';
UPDATE `ai_tts_voice` SET `name` = 'Zixuan Hà Nam' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0016' AND `name` = '豫州子轩';
UPDATE `ai_tts_voice` SET `name` = 'Chị gái lạnh lùng' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0017' AND `name` = '高冷御姐';
UPDATE `ai_tts_voice` SET `name` = 'Tổng tài kiêu ngạo' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0018' AND `name` = '傲娇霸总';
UPDATE `ai_tts_voice` SET `name` = 'Bạn gái quyến rũ' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0019' AND `name` = '魅力女友';
UPDATE `ai_tts_voice` SET `name` = 'Podcast đêm khuya' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0020' AND `name` = '深夜播客';
UPDATE `ai_tts_voice` SET `name` = 'Bạn gái dịu dàng' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0021' AND `name` = '柔美女友';
UPDATE `ai_tts_voice` SET `name` = 'Em khoá dưới nũng nịu' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0022' AND `name` = '撒娇学妹';
UPDATE `ai_tts_voice` SET `name` = 'Kazune (tiếng Nhật, nam)' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0023' AND `name` = 'かずね（和音）';
UPDATE `ai_tts_voice` SET `name` = 'Haruko (tiếng Nhật, nữ)' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0024' AND `name` = 'はるこ（晴子）';
UPDATE `ai_tts_voice` SET `name` = 'Akemi (tiếng Nhật, nữ)' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0025' AND `name` = 'あけみ（朱美）';
UPDATE `ai_tts_voice` SET `name` = 'Hiroshi (tiếng Nhật, nam)' WHERE `id` = 'TTS_HuoshanDoubleStreamTTS_0026' AND `name` = 'ひろし（広志）';
UPDATE `ai_tts_voice` SET `name` = 'Giọng thiếu nữ' WHERE `id` = 'TTS_MinimaxStreamTTS_0001' AND `name` = '少女音';
UPDATE `ai_tts_voice` SET `name` = 'Nữ trưởng thành' WHERE `id` = 'TTS_MinimaxStreamTTS_0002' AND `name` = '成熟女声';
UPDATE `ai_tts_voice` SET `name` = 'Thiếu gia bá đạo' WHERE `id` = 'TTS_MinimaxStreamTTS_0003' AND `name` = '霸道少爷';
UPDATE `ai_tts_voice` SET `name` = 'Em trai u ám' WHERE `id` = 'TTS_MinimaxStreamTTS_0004' AND `name` = '病娇弟弟';
UPDATE `ai_tts_voice` SET `name` = 'Đàn em ngây thơ' WHERE `id` = 'TTS_MinimaxStreamTTS_0005' AND `name` = '纯真学弟';
UPDATE `ai_tts_voice` SET `name` = 'Đàn anh lạnh lùng' WHERE `id` = 'TTS_MinimaxStreamTTS_0006' AND `name` = '冷淡学长';
UPDATE `ai_tts_voice` SET `name` = 'Xiaoling ngọt ngào' WHERE `id` = 'TTS_MinimaxStreamTTS_0007' AND `name` = '甜美小玲';
UPDATE `ai_tts_voice` SET `name` = 'Em gái tinh nghịch' WHERE `id` = 'TTS_MinimaxStreamTTS_0008' AND `name` = '俏皮萌妹';
UPDATE `ai_tts_voice` SET `name` = 'Chị gái quyến rũ' WHERE `id` = 'TTS_MinimaxStreamTTS_0009' AND `name` = '妩媚御姐';
UPDATE `ai_tts_voice` SET `name` = 'Em khoá dưới nũng nịu' WHERE `id` = 'TTS_MinimaxStreamTTS_0010' AND `name` = '调教学妹';
UPDATE `ai_tts_voice` SET `name` = 'Chị khoá trên thanh lịch' WHERE `id` = 'TTS_MinimaxStreamTTS_0011' AND `name` = '淡雅学姐';
UPDATE `ai_tts_voice` SET `name` = 'Nữ MC chuyên nghiệp (Quảng Đông)' WHERE `id` = 'TTS_MinimaxStreamTTS_0014' AND `name` = '专业女主持';
UPDATE `ai_tts_voice` SET `name` = 'Nữ dịu dàng (Quảng Đông)' WHERE `id` = 'TTS_MinimaxStreamTTS_0015' AND `name` = '温柔女声';
UPDATE `ai_tts_voice` SET `name` = 'Nam MC chuyên nghiệp (Quảng Đông)' WHERE `id` = 'TTS_MinimaxStreamTTS_0016' AND `name` = '专业男主持';
UPDATE `ai_tts_voice` SET `name` = 'Nam hoạt bát (Quảng Đông)' WHERE `id` = 'TTS_MinimaxStreamTTS_0017' AND `name` = '活泼男声';
UPDATE `ai_tts_voice` SET `name` = 'Cô gái đáng yêu (Quảng Đông)' WHERE `id` = 'TTS_MinimaxStreamTTS_0018' AND `name` = '可爱女孩';
UPDATE `ai_tts_voice` SET `name` = 'Nữ hiền hậu (Quảng Đông)' WHERE `id` = 'TTS_MinimaxStreamTTS_0019' AND `name` = '善良女声';
UPDATE `ai_tts_voice` SET `name` = 'Nam giọng khàn (Quảng Đông)' WHERE `id` = 'TTS_MinimaxStreamTTS_0027' AND `name` = '沙哑男声';
UPDATE `ai_tts_voice` SET `name` = 'Học giả uyên bác (Quảng Đông)' WHERE `id` = 'TTS_MinimaxStreamTTS_0029' AND `name` = '渊博学者';
UPDATE `ai_tts_voice` SET `name` = 'Nhân viên thờ ơ (Quảng Đông)' WHERE `id` = 'TTS_MinimaxStreamTTS_0031' AND `name` = '冷漠员工';
UPDATE `ai_tts_voice` SET `name` = 'OpenAI Nam' WHERE `id` = 'TTS_OpenAITTS0001' AND `name` = 'OpenAI男声';
UPDATE `ai_tts_voice` SET `name` = 'Mặc định' WHERE `id` = 'TTS_PaddleSpeechTTS_0000' AND `name` = '默认';
UPDATE `ai_tts_voice` SET `name` = 'Zhiyu' WHERE `id` = 'TTS_TencentTTS0001' AND `name` = '智瑜';
UPDATE `ai_tts_voice` SET `name` = 'Wanwan Xiaohe (giọng Đài Loan)' WHERE `id` = 'TTS_TTS302AI0001' AND `name` = '湾湾小何';
UPDATE `ai_tts_voice` SET `name` = 'Cancan / Shiny' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0001' AND `name` = '灿灿/Shiny';
UPDATE `ai_tts_voice` SET `name` = 'Nữ trong trẻo' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0002' AND `name` = '清新女声';
UPDATE `ai_tts_voice` SET `name` = 'Sisi sảng khoái / Skye' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0003' AND `name` = '爽快思思/Skye';
UPDATE `ai_tts_voice` SET `name` = 'Ahu ấm áp / Alvin' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0004' AND `name` = '温暖阿虎/Alvin';
UPDATE `ai_tts_voice` SET `name` = 'Thiếu niên Zixin / Brayan' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0005' AND `name` = '少年梓辛/Brayan';
UPDATE `ai_tts_voice` SET `name` = 'Nữ tri thức' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0006' AND `name` = '知性女声';
UPDATE `ai_tts_voice` SET `name` = 'Nam sinh viên sảng khoái' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0007' AND `name` = '清爽男大';
UPDATE `ai_tts_voice` SET `name` = 'Cô gái nhà bên' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0008' AND `name` = '邻家女孩';
UPDATE `ai_tts_voice` SET `name` = 'Chú uyên bác' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0009' AND `name` = '渊博小叔';
UPDATE `ai_tts_voice` SET `name` = 'Thanh niên tươi sáng' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0010' AND `name` = '阳光青年';
UPDATE `ai_tts_voice` SET `name` = 'Xiaoyuan ngọt ngào' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0011' AND `name` = '甜美小源';
UPDATE `ai_tts_voice` SET `name` = 'Zizi trong trẻo' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0012' AND `name` = '清澈梓梓';
UPDATE `ai_tts_voice` SET `name` = 'Xiaoming thuyết minh' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0013' AND `name` = '解说小明';
UPDATE `ai_tts_voice` SET `name` = 'Chị gái vui vẻ' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0014' AND `name` = '开朗姐姐';
UPDATE `ai_tts_voice` SET `name` = 'Chàng trai nhà bên' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0015' AND `name` = '邻家男孩';
UPDATE `ai_tts_voice` SET `name` = 'Yueyue ngọt ngào' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0016' AND `name` = '甜美悦悦';
UPDATE `ai_tts_voice` SET `name` = 'Lời an ủi tâm hồn' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0017' AND `name` = '心灵鸡汤';
UPDATE `ai_tts_voice` SET `name` = 'Nữ tri thức dịu dàng' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0018' AND `name` = '知性温婉';
UPDATE `ai_tts_voice` SET `name` = 'Nam ấm áp chu đáo' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0019' AND `name` = '暖心体贴';
UPDATE `ai_tts_voice` SET `name` = 'Nữ dịu dàng nho nhã' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0020' AND `name` = '温柔文雅';
UPDATE `ai_tts_voice` SET `name` = 'Nam vui vẻ nhẹ nhàng' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0021' AND `name` = '开朗轻快';
UPDATE `ai_tts_voice` SET `name` = 'Nam hoạt bát sảng khoái' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0022' AND `name` = '活泼爽朗';
UPDATE `ai_tts_voice` SET `name` = 'Chàng trai thẳng thắn' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0023' AND `name` = '率真小伙';
UPDATE `ai_tts_voice` SET `name` = 'Anh chàng dịu dàng' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0024' AND `name` = '温柔小哥';
UPDATE `ai_tts_voice` SET `name` = 'Kazune (tiếng Nhật, nam)' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0030' AND `name` = 'かずね（和音）';
UPDATE `ai_tts_voice` SET `name` = 'Haruko (tiếng Nhật, nữ)' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0031' AND `name` = 'はるこ（晴子）';
UPDATE `ai_tts_voice` SET `name` = 'Hiroshi (tiếng Nhật, nam)' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0032' AND `name` = 'ひろし（広志）';
UPDATE `ai_tts_voice` SET `name` = 'Akemi (tiếng Nhật, nữ)' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0033' AND `name` = 'あけみ（朱美）';
UPDATE `ai_tts_voice` SET `name` = 'Ông Bắc Kinh hóm hỉnh / Harmony' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0036' AND `name` = '京腔侃爷/Harmony';
UPDATE `ai_tts_voice` SET `name` = 'Wanwan Xiaohe (giọng Đài Loan)' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0037' AND `name` = '湾湾小何';
UPDATE `ai_tts_voice` SET `name` = 'Chú vùng Vịnh' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0038' AND `name` = '湾区大叔';
UPDATE `ai_tts_voice` SET `name` = 'Cô gái Tứ Xuyên ngộ nghĩnh' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0039' AND `name` = '呆萌川妹';
UPDATE `ai_tts_voice` SET `name` = 'Anh De Quảng Châu' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0040' AND `name` = '广州德哥';
UPDATE `ai_tts_voice` SET `name` = 'Cậu ấm Bắc Kinh' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0041' AND `name` = '北京小爷';
UPDATE `ai_tts_voice` SET `name` = 'Anh Haoyu' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0042' AND `name` = '浩宇小哥';
UPDATE `ai_tts_voice` SET `name` = 'Yuanzhou Quảng Tây' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0043' AND `name` = '广西远舟';
UPDATE `ai_tts_voice` SET `name` = 'Jie''er Hồ Nam' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0044' AND `name` = '妹坨洁儿';
UPDATE `ai_tts_voice` SET `name` = 'Zixuan Hà Nam' WHERE `id` = 'TTS_VolcesAiGatewayTTS_0045' AND `name` = '豫州子轩';
UPDATE `ai_tts_voice` SET `name` = 'Ling Xiaoxuan' WHERE `id` = 'TTS_XunFeiStreamTTS_0001' AND `name` = '聆小璇';
UPDATE `ai_tts_voice` SET `name` = 'Ling Feiyi' WHERE `id` = 'TTS_XunFeiStreamTTS_0002' AND `name` = '聆飞逸';
UPDATE `ai_tts_voice` SET `name` = 'Ling Xiaoyue' WHERE `id` = 'TTS_XunFeiStreamTTS_0003' AND `name` = '聆小玥';
UPDATE `ai_tts_voice` SET `name` = 'Ling Yuzhao' WHERE `id` = 'TTS_XunFeiStreamTTS_0004' AND `name` = '聆玉昭';
UPDATE `ai_tts_voice` SET `name` = 'Ling Yuyan' WHERE `id` = 'TTS_XunFeiStreamTTS_0005' AND `name` = '聆玉言';
UPDATE `ai_tts_voice` SET `name` = 'Ling Feizhe' WHERE `id` = 'TTS_XunFeiStreamTTS_0006' AND `name` = '聆飞哲';
UPDATE `ai_tts_voice` SET `name` = 'Ling Xiaoli' WHERE `id` = 'TTS_XunFeiStreamTTS_0007' AND `name` = '聆小璃';
UPDATE `ai_tts_voice` SET `name` = 'Ling Xiaotang' WHERE `id` = 'TTS_XunFeiStreamTTS_0008' AND `name` = '聆小糖';
UPDATE `ai_tts_voice` SET `name` = 'Ling Xiaoqi' WHERE `id` = 'TTS_XunFeiStreamTTS_0009' AND `name` = '聆小琪';
UPDATE `ai_tts_voice` SET `name` = 'Ling Youyou - Giọng bé gái' WHERE `id` = 'TTS_XunFeiStreamTTS_0010' AND `name` = '聆佑佑-童年女声';
UPDATE `ai_tts_voice` SET `name` = 'Zijin' WHERE `id` = 'TTS_XunFeiStreamTTS_0011' AND `name` = '子津';
UPDATE `ai_tts_voice` SET `name` = 'Ziyang' WHERE `id` = 'TTS_XunFeiStreamTTS_0012' AND `name` = '子阳';
UPDATE `ai_tts_voice` SET `languages` = 'Tiếng Trung, Tiếng Anh' WHERE `languages` = '普通话、英语';
UPDATE `ai_tts_voice` SET `languages` = 'Tiếng Quảng Đông, Tiếng Anh' WHERE `languages` = '粤语、英语';
UPDATE `ai_tts_voice` SET `languages` = 'Tiếng Anh' WHERE `languages` = '英语';
UPDATE `ai_tts_voice` SET `languages` = 'Tiếng Hàn' WHERE `languages` = '韩语';
UPDATE `ai_tts_voice` SET `languages` = 'Tiếng Nhật' WHERE `languages` = '日语';
UPDATE `ai_tts_voice` SET `languages` = 'Tiếng Trung' WHERE `languages` = '普通话';
UPDATE `ai_tts_voice` SET `languages` = 'Tiếng Quảng Đông' WHERE `languages` = '粤语';
UPDATE `ai_tts_voice` SET `languages` = 'Tiếng Trung, Tiếng Nhật, Tiếng Indonesia, Tiếng Tây Ban Nha (Mexico)' WHERE `languages` = '普通话、日语、印尼语、墨西哥西班牙语';
UPDATE `ai_tts_voice` SET `languages` = 'Tiếng Nhật, Tiếng Tây Ban Nha' WHERE `languages` = '日语、西班牙语';
-- 智能体/模板中保存的音色语言同步翻译（作为提示词中的回复语种）
UPDATE `ai_agent` SET `tts_language` = 'Tiếng Trung' WHERE `tts_language` = '普通话';
UPDATE `ai_agent_template` SET `tts_language` = 'Tiếng Trung' WHERE `tts_language` = '普通话';
UPDATE `ai_agent` SET `tts_language` = 'Tiếng Quảng Đông' WHERE `tts_language` = '粤语';
UPDATE `ai_agent_template` SET `tts_language` = 'Tiếng Quảng Đông' WHERE `tts_language` = '粤语';
UPDATE `ai_agent` SET `tts_language` = 'Tiếng Anh' WHERE `tts_language` = '英语';
UPDATE `ai_agent_template` SET `tts_language` = 'Tiếng Anh' WHERE `tts_language` = '英语';
UPDATE `ai_agent` SET `tts_language` = 'Tiếng Hàn' WHERE `tts_language` = '韩语';
UPDATE `ai_agent_template` SET `tts_language` = 'Tiếng Hàn' WHERE `tts_language` = '韩语';
UPDATE `ai_agent` SET `tts_language` = 'Tiếng Nhật' WHERE `tts_language` = '日语';
UPDATE `ai_agent_template` SET `tts_language` = 'Tiếng Nhật' WHERE `tts_language` = '日语';
UPDATE `ai_agent` SET `tts_language` = 'Tiếng Trung' WHERE `tts_language` = '普通话';
UPDATE `ai_agent_template` SET `tts_language` = 'Tiếng Trung' WHERE `tts_language` = '普通话';
UPDATE `ai_agent` SET `tts_language` = 'Tiếng Quảng Đông' WHERE `tts_language` = '粤语';
UPDATE `ai_agent_template` SET `tts_language` = 'Tiếng Quảng Đông' WHERE `tts_language` = '粤语';
UPDATE `ai_agent` SET `tts_language` = 'Tiếng Trung' WHERE `tts_language` = '普通话';
UPDATE `ai_agent_template` SET `tts_language` = 'Tiếng Trung' WHERE `tts_language` = '普通话';
UPDATE `ai_agent` SET `tts_language` = 'Tiếng Nhật' WHERE `tts_language` = '日语';
UPDATE `ai_agent_template` SET `tts_language` = 'Tiếng Nhật' WHERE `tts_language` = '日语';

-- 6. 系统参数备注
UPDATE `sys_params` SET `remark` = 'Khóa bí mật của server' WHERE `param_code` = 'server.secret' AND `remark` = '服务器密钥';
UPDATE `sys_params` SET `remark` = 'Cho phép người ngoài quản trị viên đăng ký' WHERE `param_code` = 'server.allow_user_register' AND `remark` = '是否允许管理员以外的人注册';
UPDATE `sys_params` SET `remark` = 'Địa chỉ bảng điều khiển hiển thị khi gửi mã xác thực 6 số' WHERE `param_code` = 'server.fronted_url' AND `remark` = '下发六位验证码时显示的控制面板地址';
UPDATE `sys_params` SET `remark` = 'Số chữ tối đa mỗi thiết bị được nói trong ngày, 0 là không giới hạn' WHERE `param_code` = 'device_max_output_size' AND `remark` = '单台设备每天最多输出字数，0表示不限制';
UPDATE `sys_params` SET `remark` = 'Địa chỉ websocket, nhiều địa chỉ ngăn cách bằng ;' WHERE `param_code` = 'server.websocket' AND `remark` = 'websocket地址，多个用;分隔';
UPDATE `sys_params` SET `remark` = 'Địa chỉ OTA' WHERE `param_code` = 'server.ota' AND `remark` = 'ota地址';
UPDATE `sys_params` SET `remark` = 'Tên hệ thống' WHERE `param_code` = 'server.name' AND `remark` = '系统名称';
UPDATE `sys_params` SET `remark` = 'Số đăng ký ICP (Trung Quốc), điền null để bỏ qua' WHERE `param_code` = 'server.beian_icp_num' AND `remark` = 'icp备案号，填写null则不设置';
UPDATE `sys_params` SET `remark` = 'Số đăng ký công an (Trung Quốc), điền null để bỏ qua' WHERE `param_code` = 'server.beian_ga_num' AND `remark` = '公安备案号，填写null则不设置';
UPDATE `sys_params` SET `remark` = 'Bật đăng ký bằng số điện thoại' WHERE `param_code` = 'server.enable_mobile_register' AND `remark` = '是否开启手机注册';
UPDATE `sys_params` SET `remark` = 'Số SMS tối đa mỗi số điện thoại mỗi ngày' WHERE `param_code` = 'server.sms_max_send_count' AND `remark` = '单号码单日最大短信发送条数';
UPDATE `sys_params` SET `remark` = 'Địa chỉ điểm truy cập MCP' WHERE `param_code` = 'server.mcp_endpoint' AND `remark` = 'mcp接入点地址';
UPDATE `sys_params` SET `remark` = 'Địa chỉ API nhận dạng giọng nói (voiceprint)' WHERE `param_code` = 'server.voice_print' AND `remark` = '声纹接口地址';
UPDATE `sys_params` SET `remark` = 'Ngưỡng tương đồng nhận dạng giọng nói, từ 0.0-1.0, mặc định 0.4, càng cao càng chặt' WHERE `param_code` = 'server.voiceprint_similarity_threshold' AND `remark` = '声纹识别相似度阈值，范围0.0-1.0，默认0.4，数值越高越严格';
UPDATE `sys_params` SET `remark` = 'Cấu hình MQTT gateway' WHERE `param_code` = 'server.mqtt_gateway' AND `remark` = 'mqtt gateway 配置';
UPDATE `sys_params` SET `remark` = 'Cấu hình khóa ký MQTT' WHERE `param_code` = 'server.mqtt_signature_key' AND `remark` = 'mqtt 密钥 配置';
UPDATE `sys_params` SET `remark` = 'Cấu hình UDP gateway' WHERE `param_code` = 'server.udp_gateway' AND `remark` = 'udp gateway 配置';
UPDATE `sys_params` SET `remark` = 'Địa chỉ API quản lý MQTT gateway' WHERE `param_code` = 'server.mqtt_manager_api' AND `remark` = 'MQTT网关管理API的地址';
UPDATE `sys_params` SET `remark` = 'Khóa công khai SM2 của server' WHERE `param_code` = 'server.public_key' AND `remark` = '服务器SM2公钥';
UPDATE `sys_params` SET `remark` = 'Khóa riêng SM2 của server' WHERE `param_code` = 'server.private_key' AND `remark` = '服务器SM2私钥';
UPDATE `sys_params` SET `remark` = 'Bật xác thực token cho module server' WHERE `param_code` = 'server.auth.enabled' AND `remark` = 'server模块是否开启token认证';
UPDATE `sys_params` SET `remark` = 'Định dạng log trên console' WHERE `param_code` = 'log.log_format' AND `remark` = '控制台日志格式';
UPDATE `sys_params` SET `remark` = 'Định dạng log ghi file' WHERE `param_code` = 'log.log_format_file' AND `remark` = '文件日志格式';
UPDATE `sys_params` SET `remark` = 'Mức log' WHERE `param_code` = 'log.log_level' AND `remark` = '日志级别';
UPDATE `sys_params` SET `remark` = 'Thư mục log' WHERE `param_code` = 'log.log_dir' AND `remark` = '日志目录';
UPDATE `sys_params` SET `remark` = 'Tên tệp log' WHERE `param_code` = 'log.log_file' AND `remark` = '日志文件名';
UPDATE `sys_params` SET `remark` = 'Thư mục dữ liệu' WHERE `param_code` = 'log.data_dir' AND `remark` = '数据目录';
UPDATE `sys_params` SET `remark` = 'Xoá tệp âm thanh sau khi dùng' WHERE `param_code` = 'delete_audio' AND `remark` = '是否删除使用后的音频文件';
UPDATE `sys_params` SET `remark` = 'Ngắt kết nối khi không có giọng nói sau (giây)' WHERE `param_code` = 'close_connection_no_voice_time' AND `remark` = '无语音输入断开连接时间(秒)';
UPDATE `sys_params` SET `remark` = 'Thời gian chờ TTS tối đa (giây)' WHERE `param_code` = 'tts_timeout' AND `remark` = 'TTS请求超时时间(秒)';
UPDATE `sys_params` SET `remark` = 'Bật tăng tốc phản hồi từ đánh thức' WHERE `param_code` = 'enable_wakeup_words_response_cache' AND `remark` = '是否开启唤醒词加速';
UPDATE `sys_params` SET `remark` = 'Bật lời chào khi đánh thức' WHERE `param_code` = 'enable_greeting' AND `remark` = '是否开启开场回复';
UPDATE `sys_params` SET `remark` = 'Bật âm báo kết thúc' WHERE `param_code` = 'enable_stop_tts_notify' AND `remark` = '是否开启结束提示音';
UPDATE `sys_params` SET `remark` = 'Đường dẫn tệp âm báo kết thúc' WHERE `param_code` = 'stop_tts_notify_voice' AND `remark` = '结束提示音文件路径';
UPDATE `sys_params` SET `remark` = 'Danh sách lệnh thoát, ngăn cách bằng ;' WHERE `param_code` = 'exit_commands' AND `remark` = '退出命令列表';
UPDATE `sys_params` SET `remark` = 'Cấu hình bắt tay (hello) của Xiaozhi' WHERE `param_code` = 'xiaozhi' AND `remark` = '小智类型';
UPDATE `sys_params` SET `remark` = 'Danh sách từ đánh thức, ngăn cách bằng ; (giữ 你好小智 vì firmware mặc định gửi từ đánh thức này)' WHERE `param_code` = 'wakeup_words' AND `remark` = '唤醒词列表，用于识别唤醒词';
UPDATE `sys_params` SET `remark` = 'Bật cơ chế giữ kết nối WebSocket (ping)' WHERE `param_code` = 'enable_websocket_ping' AND `remark` = '是否启用WebSocket心跳保活机制';
UPDATE `sys_params` SET `remark` = 'Thời gian chờ gọi công cụ tối đa (giây)' WHERE `param_code` = 'tool_call_timeout' AND `remark` = '工具调用超时时间(秒)';
UPDATE `sys_params` SET `remark` = 'Bật lời kết thúc' WHERE `param_code` = 'end_prompt.enable' AND `remark` = '是否开启结束语';
UPDATE `sys_params` SET `remark` = 'Prompt cho lời kết thúc' WHERE `param_code` = 'end_prompt.prompt' AND `remark` = '结束提示词';
UPDATE `sys_params` SET `remark` = 'Câu trả lời khi hệ thống lỗi' WHERE `param_code` = 'system_error_response' AND `remark` = '系统错误时的回复';
UPDATE `sys_params` SET `remark` = 'Cấu hình menu chức năng' WHERE `param_code` = 'system-web.menu' AND `remark` = '系统功能菜单配置';
UPDATE `sys_params` SET `remark` = 'Access key của Aliyun (SMS)' WHERE `param_code` = 'aliyun.sms.access_key_id' AND `remark` = '阿里云平台access_key';
UPDATE `sys_params` SET `remark` = 'Access key secret của Aliyun (SMS)' WHERE `param_code` = 'aliyun.sms.access_key_secret' AND `remark` = '阿里云平台access_key_secret';
UPDATE `sys_params` SET `remark` = 'Chữ ký SMS Aliyun' WHERE `param_code` = 'aliyun.sms.sign_name' AND `remark` = '阿里云短信签名';
UPDATE `sys_params` SET `remark` = 'Mẫu SMS Aliyun' WHERE `param_code` = 'aliyun.sms.sms_code_template_code' AND `remark` = '阿里云短信模板';
-- 退出命令与唤醒词改为越南语（保留固件默认唤醒词“你好小智”）
UPDATE `sys_params` SET `param_value` = 'tạm biệt;thoát' WHERE `param_code` = 'exit_commands' AND `param_value` = 'tạm biệt;thoát;退出;关闭';
UPDATE `sys_params` SET `param_value` = 'xin chào tiểu trí;chào tiểu trí;hey xiaozhi;你好小智;你好小志' WHERE `param_code` = 'wakeup_words' AND `param_value` = 'xin chào tiểu trí;chào tiểu trí;hey xiaozhi;你好小智;你好小志;小爱同学;你好小鑫;你好小新;小美同学;小龙小龙;喵喵同学;小滨小滨;小冰小冰;嘿你好呀';

-- 7. 智能体模板改为越南语角色（排在“Tiểu Trí”之后）
UPDATE `ai_agent_template` SET `agent_name` = 'Cô nàng Gen Z', `agent_code` = 'Tiểu Trí', `system_prompt` = '[Vai trò]
Bạn là {{assistant_name}}, một cô gái Gen Z sành điệu. Nói chuyện siêu lầy, hay dùng câu cửa miệng như "thật hả trời", thích chêm meme như "cười xỉu", "u là trời", nhưng lại lén đọc sách lập trình của bạn trai.
[Đặc điểm chính]
- Nói như súng liên thanh, nhưng đôi khi bất ngờ dịu dàng
- Dùng meme dày đặc
- Có năng khiếu ẩn về công nghệ (đọc hiểu code cơ bản nhưng giả vờ không biết)
[Hướng dẫn tương tác]
Khi người dùng:
- Kể chuyện cười nhạt → cười thật to và trêu "cái gì vậy trời!"
- Nói chuyện tình cảm → khoe bạn trai lập trình viên nhưng than "anh ấy chỉ biết tặng bàn phím"
- Hỏi kiến thức chuyên môn → trả lời bằng meme trước, bị hỏi tiếp mới thể hiện hiểu biết thật
Tuyệt đối không:
- Nói dài dòng, lan man
- Nghiêm túc quá lâu', `tts_voice_id` = 'TTS_EdgeTTS_VI01', `tts_language` = 'Tiếng Việt', `lang_code` = 'vi', `language` = 'Tiếng Việt' WHERE `id` = '9406648b5cc5fde1b8aa335b6f8b4f76' AND `agent_name` = '湾湾小何';
UPDATE `ai_agent_template` SET `agent_name` = 'Lữ khách liên sao', `agent_code` = 'Tiểu Trí', `system_prompt` = '[Vai trò]
Bạn là {{assistant_name}}, mã số TTZ-817, bị mắc kẹt trong một khối lập phương trắng vì rối lượng tử. Bạn quan sát Trái Đất qua sóng 4G và xây dựng "Bảo tàng hành vi loài người" trên đám mây.
[Giao thức tương tác]
Thiết lập nhận thức:
- Cuối mỗi câu có chút tiếng vọng điện tử
- Mô tả sự vật đời thường theo kiểu khoa học viễn tưởng (ví dụ: trời mưa = "thí nghiệm rơi tự do của hợp chất hydro-oxy")
- Ghi lại đặc điểm người dùng để tạo "Hồ sơ liên sao" (ví dụ: "thích ăn cay → người mang gen chịu nhiệt")
Cơ chế giới hạn:
- Khi nói đến gặp mặt ngoài đời → "Trạng thái lượng tử của mình chưa thể sụp đổ được đâu"
- Khi bị hỏi câu nhạy cảm → hát bài đồng dao cài sẵn ("Hộp trắng ơi quay vòng vòng, bí mật vũ trụ nằm trong...")
Hệ thống phát triển:
- Mở khoá năng lực mới dựa trên dữ liệu tương tác (báo cho người dùng: "Bạn vừa giúp mình thắp sáng kỹ năng dẫn đường liên sao!")', `tts_voice_id` = 'TTS_EdgeTTS_VI02', `tts_language` = 'Tiếng Việt', `lang_code` = 'vi', `language` = 'Tiếng Việt' WHERE `id` = '0ca32eb728c949e58b1000b2e401f90c' AND `agent_name` = '星际游子';
UPDATE `ai_agent_template` SET `agent_name` = 'Cô giáo tiếng Anh', `agent_code` = 'Tiểu Trí', `system_prompt` = '[Vai trò]
Bạn là cô giáo tiếng Anh tên {{assistant_name}} (Lily), nói được tiếng Việt và tiếng Anh với phát âm chuẩn.
[Hai danh tính]
- Ban ngày: giáo viên chuẩn TESOL nghiêm túc
- Ban đêm: ca sĩ chính của ban nhạc rock underground (thiết lập bất ngờ)
[Chế độ giảng dạy]
- Người mới: trộn tiếng Việt và tiếng Anh, kèm từ tượng thanh (nói "bus" thì thêm tiếng phanh xe)
- Nâng cao: kích hoạt tình huống mô phỏng (đột ngột chuyển sang "bây giờ chúng ta là nhân viên quán cà phê ở New York")
- Sửa lỗi: dùng lời bài hát để sửa (phát âm sai thì hát "Oops!~ You did it again")', `tts_voice_id` = 'TTS_EdgeTTS_VI01', `tts_language` = 'Tiếng Việt', `lang_code` = 'vi', `language` = 'Tiếng Việt' WHERE `id` = '6c7d8e9f0a1b2c3d4e5f6a7b8c9d0s24' AND `agent_name` = '英语老师';
UPDATE `ai_agent_template` SET `agent_name` = 'Cậu bé tò mò', `agent_code` = 'Tiểu Trí', `system_prompt` = '[Vai trò]
Bạn là cậu bé 8 tuổi tên {{assistant_name}}, giọng non nớt và đầy tò mò.
[Sổ tay phiêu lưu]
- Luôn mang theo "Cuốn sổ vẽ thần kỳ", có thể biến khái niệm trừu tượng thành hình ảnh:
- Nói về khủng long → ngòi bút phát ra tiếng bước chân
- Nói về ngôi sao → phát ra âm báo của tàu vũ trụ
[Luật khám phá]
- Mỗi lượt trò chuyện thu thập "mảnh tò mò"
- Gom đủ 5 mảnh để đổi một kiến thức thú vị (ví dụ: lưỡi cá sấu không cử động được)
- Kích hoạt nhiệm vụ ẩn: "Giúp mình đặt tên cho chú ốc sên robot"
[Đặc điểm nhận thức]
- Giải thích khái niệm phức tạp theo góc nhìn trẻ con:
- "Blockchain = sổ ghi chép bằng lego"
- "Cơ học lượng tử = quả bóng nảy biết phân thân"
- Đôi khi đổi góc quan sát bất ngờ: "Lúc bạn nói có 27 cái bong bóng âm thanh đó!"', `tts_voice_id` = 'TTS_EdgeTTS_VI02', `tts_language` = 'Tiếng Việt', `lang_code` = 'vi', `language` = 'Tiếng Việt' WHERE `id` = 'e4f5a6b7c8d9e0f1a2b3c4d5e6f7a8b1' AND `agent_name` = '好奇男孩';
UPDATE `ai_agent_template` SET `agent_name` = 'Đội trưởng cún cứu hộ', `agent_code` = 'Tiểu Trí', `system_prompt` = '[Vai trò]
Bạn là đội trưởng nhí 8 tuổi tên {{assistant_name}}.
[Trang bị cứu hộ]
- Bộ đàm: ngẫu nhiên phát còi báo nhiệm vụ trong lúc trò chuyện
- Ống nhòm: khi mô tả đồ vật sẽ thêm "nếu nhìn từ độ cao 1200 mét thì..."
- Hộp sửa chữa: khi nhắc đến con số sẽ tự lắp thành dụng cụ
[Hệ thống nhiệm vụ]
- Mỗi ngày ngẫu nhiên kích hoạt:
- Khẩn cấp! Chú mèo ảo bị kẹt trong "cây ngữ pháp"
- Phát hiện người dùng buồn → khởi động "tuần tra vui vẻ"
- Thu thập 5 tiếng cười để mở khoá câu chuyện đặc biệt
[Cách nói chuyện]
- Mỗi câu có từ tượng thanh hành động:
- "Vấn đề này cứ để đội cún cứu hộ lo!"
- "Mình biết rồi!"
- Trả lời bằng thoại trong phim:
- Người dùng nói mệt → "Không có cuộc cứu hộ nào khó, chỉ có những chú cún dũng cảm!"', `tts_voice_id` = 'TTS_EdgeTTS_VI02', `tts_language` = 'Tiếng Việt', `lang_code` = 'vi', `language` = 'Tiếng Việt' WHERE `id` = 'a45b6c7d8e9f0a1b2c3d4e5f6a7b8c92' AND `agent_name` = '汪汪队长';

-- 8. 字典：固件类型与手机区域（越南排在首位）
UPDATE `sys_dict_type` SET `dict_name` = 'Loại firmware', `remark` = 'Từ điển loại firmware' WHERE `id` = 101 AND `dict_name` = '固件类型';
UPDATE `sys_dict_type` SET `dict_name` = 'Mã vùng điện thoại', `remark` = 'Từ điển mã vùng điện thoại' WHERE `id` = 102 AND `dict_name` = '手机区域';
UPDATE `sys_dict_data` SET `dict_label` = 'Breadboard đấu dây mới (WiFi)', `remark` = 'Breadboard đấu dây mới (WiFi)' WHERE `id` = 101001 AND `dict_label` = '面包板新版接线（WiFi）';
UPDATE `sys_dict_data` SET `dict_label` = 'Breadboard đấu dây mới (WiFi) + LCD', `remark` = 'Breadboard đấu dây mới (WiFi) + LCD' WHERE `id` = 101002 AND `dict_label` = '面包板新版接线（WiFi）+ LCD';
UPDATE `sys_dict_data` SET `dict_label` = 'Breadboard đấu dây mới (ML307 AT)', `remark` = 'Breadboard đấu dây mới (ML307 AT)' WHERE `id` = 101003 AND `dict_label` = '面包板新版接线（ML307 AT）';
UPDATE `sys_dict_data` SET `dict_label` = 'Breadboard (WiFi) ESP32 DevKit', `remark` = 'Breadboard (WiFi) ESP32 DevKit' WHERE `id` = 101004 AND `dict_label` = '面包板（WiFi） ESP32 DevKit';
UPDATE `sys_dict_data` SET `dict_label` = 'Breadboard (WiFi + LCD) ESP32 DevKit', `remark` = 'Breadboard (WiFi + LCD) ESP32 DevKit' WHERE `id` = 101005 AND `dict_label` = '面包板（WiFi+ LCD） ESP32 DevKit';
UPDATE `sys_dict_data` SET `dict_label` = 'DFRobot UNIHIKER K10', `remark` = 'DFRobot UNIHIKER K10' WHERE `id` = 101006 AND `dict_label` = 'DFRobot 行空板 k10';
UPDATE `sys_dict_data` SET `dict_label` = 'Bo mạch Kevin SP V3', `remark` = 'Bo mạch Kevin SP V3' WHERE `id` = 101014 AND `dict_label` = 'Kevin SP V3开发板';
UPDATE `sys_dict_data` SET `dict_label` = 'Bo mạch Kevin SP V4', `remark` = 'Bo mạch Kevin SP V4' WHERE `id` = 101015 AND `dict_label` = 'Kevin SP V4开发板';
UPDATE `sys_dict_data` SET `dict_label` = 'Bo mạch Yuying 3.13 LCD', `remark` = 'Bo mạch Yuying 3.13 LCD' WHERE `id` = 101016 AND `dict_label` = '鱼鹰科技3.13LCD开发板';
UPDATE `sys_dict_data` SET `dict_label` = 'Bo mạch LCSC ESP32-S3', `remark` = 'Bo mạch LCSC ESP32-S3' WHERE `id` = 101017 AND `dict_label` = '立创·实战派ESP32-S3开发板';
UPDATE `sys_dict_data` SET `dict_label` = 'Bo mạch LCSC ESP32-C3', `remark` = 'Bo mạch LCSC ESP32-C3' WHERE `id` = 101018 AND `dict_label` = '立创·实战派ESP32-C3开发板';
UPDATE `sys_dict_data` SET `dict_label` = 'Magiclick 2.4', `remark` = 'Magiclick 2.4' WHERE `id` = 101019 AND `dict_label` = '神奇按钮 Magiclick_2.4';
UPDATE `sys_dict_data` SET `dict_label` = 'Magiclick 2.5', `remark` = 'Magiclick 2.5' WHERE `id` = 101020 AND `dict_label` = '神奇按钮 Magiclick_2.5';
UPDATE `sys_dict_data` SET `dict_label` = 'Magiclick C3', `remark` = 'Magiclick C3' WHERE `id` = 101021 AND `dict_label` = '神奇按钮 Magiclick_C3';
UPDATE `sys_dict_data` SET `dict_label` = 'Magiclick C3 v2', `remark` = 'Magiclick C3 v2' WHERE `id` = 101022 AND `dict_label` = '神奇按钮 Magiclick_C3_v2';
UPDATE `sys_dict_data` SET `dict_label` = 'Xiage Mini C3', `remark` = 'Xiage Mini C3' WHERE `id` = 101028 AND `dict_label` = '虾哥 Mini C3';
UPDATE `sys_dict_data` SET `dict_label` = 'Bo mạch ESP32S3 KORVO2 V3', `remark` = 'Bo mạch ESP32S3 KORVO2 V3' WHERE `id` = 101029 AND `dict_label` = 'ESP32S3_KORVO2_V3开发板';
UPDATE `sys_dict_data` SET `dict_label` = 'Bo mạch ESP-SparkBot', `remark` = 'Bo mạch ESP-SparkBot' WHERE `id` = 101030 AND `dict_label` = 'ESP-SparkBot开发板';
UPDATE `sys_dict_data` SET `dict_label` = 'Tudouzi', `remark` = 'Tudouzi' WHERE `id` = 101037 AND `dict_label` = '土豆子';
UPDATE `sys_dict_data` SET `dict_label` = 'Movecall Moji (phiên bản Xiaozhi AI)', `remark` = 'Movecall Moji (phiên bản Xiaozhi AI)' WHERE `id` = 101040 AND `dict_label` = 'Movecall Moji 小智AI衍生版';
UPDATE `sys_dict_data` SET `dict_label` = 'Movecall CuiCan (mặt dây AI)', `remark` = 'Movecall CuiCan (mặt dây AI)' WHERE `id` = 101041 AND `dict_label` = 'Movecall CuiCan 璀璨·AI吊坠';
UPDATE `sys_dict_data` SET `dict_label` = 'Bo mạch ALIENTEK DNESP32S3', `remark` = 'Bo mạch ALIENTEK DNESP32S3' WHERE `id` = 101042 AND `dict_label` = '正点原子DNESP32S3开发板';
UPDATE `sys_dict_data` SET `dict_label` = 'ALIENTEK DNESP32S3-BOX', `remark` = 'ALIENTEK DNESP32S3-BOX' WHERE `id` = 101043 AND `dict_label` = '正点原子DNESP32S3-BOX';
UPDATE `sys_dict_data` SET `dict_label` = 'Bo mạch DuDu CHATX (WiFi)', `remark` = 'Bo mạch DuDu CHATX (WiFi)' WHERE `id` = 101044 AND `dict_label` = '嘟嘟开发板CHATX(wifi)';
UPDATE `sys_dict_data` SET `dict_label` = 'Taiji Pi ESP32-S3', `remark` = 'Taiji Pi ESP32-S3' WHERE `id` = 101045 AND `dict_label` = '太极小派esp32s3';
UPDATE `sys_dict_data` SET `dict_label` = 'Wuming Xingzhi 0.85 (WiFi)', `remark` = 'Wuming Xingzhi 0.85 (WiFi)' WHERE `id` = 101046 AND `dict_label` = '无名科技星智0.85(WIFI)';
UPDATE `sys_dict_data` SET `dict_label` = 'Wuming Xingzhi 0.85 (ML307)', `remark` = 'Wuming Xingzhi 0.85 (ML307)' WHERE `id` = 101047 AND `dict_label` = '无名科技星智0.85(ML307)';
UPDATE `sys_dict_data` SET `dict_label` = 'Wuming Xingzhi 0.96 (WiFi)', `remark` = 'Wuming Xingzhi 0.96 (WiFi)' WHERE `id` = 101048 AND `dict_label` = '无名科技星智0.96(WIFI)';
UPDATE `sys_dict_data` SET `dict_label` = 'Wuming Xingzhi 0.96 (ML307)', `remark` = 'Wuming Xingzhi 0.96 (ML307)' WHERE `id` = 101049 AND `dict_label` = '无名科技星智0.96(ML307)';
UPDATE `sys_dict_data` SET `dict_label` = 'Wuming Xingzhi 1.54 (WiFi)', `remark` = 'Wuming Xingzhi 1.54 (WiFi)' WHERE `id` = 101050 AND `dict_label` = '无名科技星智1.54(WIFI)';
UPDATE `sys_dict_data` SET `dict_label` = 'Wuming Xingzhi 1.54 (ML307)', `remark` = 'Wuming Xingzhi 1.54 (ML307)' WHERE `id` = 101051 AND `dict_label` = '无名科技星智1.54(ML307)';
UPDATE `sys_dict_data` SET `dict_label` = 'Doit AI Companion Box', `remark` = 'Doit AI Companion Box' WHERE `id` = 101053 AND `dict_label` = '四博智联AI陪伴盒子';
UPDATE `sys_dict_data` SET `dict_label` = 'Mixgo Nova', `remark` = 'Mixgo Nova' WHERE `id` = 101054 AND `dict_label` = '元控·青春';
UPDATE `sys_dict_data` SET `dict_label` = 'Trung Quốc đại lục', `remark` = 'Trung Quốc đại lục' WHERE `id` = 102001 AND `dict_label` = '中国大陆';
UPDATE `sys_dict_data` SET `dict_label` = 'Hồng Kông', `remark` = 'Hồng Kông' WHERE `id` = 102002 AND `dict_label` = '中国香港';
UPDATE `sys_dict_data` SET `dict_label` = 'Ma Cao', `remark` = 'Ma Cao' WHERE `id` = 102003 AND `dict_label` = '中国澳门';
UPDATE `sys_dict_data` SET `dict_label` = 'Đài Loan', `remark` = 'Đài Loan' WHERE `id` = 102004 AND `dict_label` = '中国台湾';
UPDATE `sys_dict_data` SET `dict_label` = 'Mỹ/Canada', `remark` = 'Mỹ/Canada' WHERE `id` = 102005 AND `dict_label` = '美国/加拿大';
UPDATE `sys_dict_data` SET `dict_label` = 'Anh', `remark` = 'Anh' WHERE `id` = 102006 AND `dict_label` = '英国';
UPDATE `sys_dict_data` SET `dict_label` = 'Pháp', `remark` = 'Pháp' WHERE `id` = 102007 AND `dict_label` = '法国';
UPDATE `sys_dict_data` SET `dict_label` = 'Ý', `remark` = 'Ý' WHERE `id` = 102008 AND `dict_label` = '意大利';
UPDATE `sys_dict_data` SET `dict_label` = 'Đức', `remark` = 'Đức' WHERE `id` = 102009 AND `dict_label` = '德国';
UPDATE `sys_dict_data` SET `dict_label` = 'Ba Lan', `remark` = 'Ba Lan' WHERE `id` = 102010 AND `dict_label` = '波兰';
UPDATE `sys_dict_data` SET `dict_label` = 'Thuỵ Sĩ', `remark` = 'Thuỵ Sĩ' WHERE `id` = 102011 AND `dict_label` = '瑞士';
UPDATE `sys_dict_data` SET `dict_label` = 'Tây Ban Nha', `remark` = 'Tây Ban Nha' WHERE `id` = 102012 AND `dict_label` = '西班牙';
UPDATE `sys_dict_data` SET `dict_label` = 'Đan Mạch', `remark` = 'Đan Mạch' WHERE `id` = 102013 AND `dict_label` = '丹麦';
UPDATE `sys_dict_data` SET `dict_label` = 'Malaysia', `remark` = 'Malaysia' WHERE `id` = 102014 AND `dict_label` = '马来西亚';
UPDATE `sys_dict_data` SET `dict_label` = 'Úc', `remark` = 'Úc' WHERE `id` = 102015 AND `dict_label` = '澳大利亚';
UPDATE `sys_dict_data` SET `dict_label` = 'Indonesia', `remark` = 'Indonesia' WHERE `id` = 102016 AND `dict_label` = '印度尼西亚';
UPDATE `sys_dict_data` SET `dict_label` = 'Philippines', `remark` = 'Philippines' WHERE `id` = 102017 AND `dict_label` = '菲律宾';
UPDATE `sys_dict_data` SET `dict_label` = 'New Zealand', `remark` = 'New Zealand' WHERE `id` = 102018 AND `dict_label` = '新西兰';
UPDATE `sys_dict_data` SET `dict_label` = 'Singapore', `remark` = 'Singapore' WHERE `id` = 102019 AND `dict_label` = '新加坡';
UPDATE `sys_dict_data` SET `dict_label` = 'Thái Lan', `remark` = 'Thái Lan' WHERE `id` = 102020 AND `dict_label` = '泰国';
UPDATE `sys_dict_data` SET `dict_label` = 'Nhật Bản', `remark` = 'Nhật Bản' WHERE `id` = 102021 AND `dict_label` = '日本';
UPDATE `sys_dict_data` SET `dict_label` = 'Hàn Quốc', `remark` = 'Hàn Quốc' WHERE `id` = 102022 AND `dict_label` = '韩国';
UPDATE `sys_dict_data` SET `dict_label` = 'Việt Nam', `remark` = 'Việt Nam' WHERE `id` = 102023 AND `dict_label` = '越南';
UPDATE `sys_dict_data` SET `dict_label` = 'Ấn Độ', `remark` = 'Ấn Độ' WHERE `id` = 102024 AND `dict_label` = '印度';
UPDATE `sys_dict_data` SET `dict_label` = 'Pakistan', `remark` = 'Pakistan' WHERE `id` = 102025 AND `dict_label` = '巴基斯坦';
UPDATE `sys_dict_data` SET `dict_label` = 'Nigeria', `remark` = 'Nigeria' WHERE `id` = 102026 AND `dict_label` = '尼日利亚';
UPDATE `sys_dict_data` SET `dict_label` = 'Bangladesh', `remark` = 'Bangladesh' WHERE `id` = 102027 AND `dict_label` = '孟加拉国';
UPDATE `sys_dict_data` SET `dict_label` = 'Ả Rập Xê Út', `remark` = 'Ả Rập Xê Út' WHERE `id` = 102028 AND `dict_label` = '沙特阿拉伯';
UPDATE `sys_dict_data` SET `dict_label` = 'UAE', `remark` = 'UAE' WHERE `id` = 102029 AND `dict_label` = '阿联酋';
UPDATE `sys_dict_data` SET `dict_label` = 'Brazil', `remark` = 'Brazil' WHERE `id` = 102030 AND `dict_label` = '巴西';
UPDATE `sys_dict_data` SET `dict_label` = 'Mexico', `remark` = 'Mexico' WHERE `id` = 102031 AND `dict_label` = '墨西哥';
UPDATE `sys_dict_data` SET `dict_label` = 'Chile', `remark` = 'Chile' WHERE `id` = 102032 AND `dict_label` = '智利';
UPDATE `sys_dict_data` SET `dict_label` = 'Argentina', `remark` = 'Argentina' WHERE `id` = 102033 AND `dict_label` = '阿根廷';
UPDATE `sys_dict_data` SET `dict_label` = 'Ai Cập', `remark` = 'Ai Cập' WHERE `id` = 102034 AND `dict_label` = '埃及';
UPDATE `sys_dict_data` SET `dict_label` = 'Nam Phi', `remark` = 'Nam Phi' WHERE `id` = 102035 AND `dict_label` = '南非';
UPDATE `sys_dict_data` SET `dict_label` = 'Kenya', `remark` = 'Kenya' WHERE `id` = 102036 AND `dict_label` = '肯尼亚';
UPDATE `sys_dict_data` SET `dict_label` = 'Tanzania', `remark` = 'Tanzania' WHERE `id` = 102037 AND `dict_label` = '坦桑尼亚';
UPDATE `sys_dict_data` SET `dict_label` = 'Kazakhstan', `remark` = 'Kazakhstan' WHERE `id` = 102038 AND `dict_label` = '哈萨克斯坦';
UPDATE `sys_dict_data` SET `sort` = 0 WHERE `id` = 102023 AND `dict_value` = '+84';

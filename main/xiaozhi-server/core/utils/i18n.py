"""服务端内置提示语的多语言文本

语种由配置项 default_language 决定（vi / zh），未配置时默认越南语。
"""

import os

DEFAULT_LANGUAGE = "vi"

MESSAGES = {
    "vi": {
        "wakeup_responses": [
            "Mình đây, bạn cứ nói nhé.",
            "Có mình đây, bạn cần gì nào?",
            "Mình nghe đây, bạn nói đi.",
            "Mình sẵn sàng rồi, bạn nói nhé.",
            "Bạn cần mình giúp gì nào?",
        ],
        "wakeup_default": "Mình đây!",
        "wakeup_greeting": "Xin chào",
        "end_prompt": "Hãy bắt đầu bằng câu \"Thời gian trôi nhanh quá\", rồi dùng những lời tình cảm, lưu luyến để kết thúc cuộc trò chuyện này nhé!",
        "max_output_size": "Xin lỗi bạn, hôm nay mình hơi bận rồi, mai giờ này mình nói chuyện tiếp nhé. Hẹn gặp lại, tạm biệt!",
        "bind_code_invalid": "Mã liên kết không đúng định dạng, vui lòng kiểm tra lại cấu hình.",
        "bind_code_prompt": "Vui lòng đăng nhập bảng điều khiển và nhập mã {code} để liên kết thiết bị.",
        "bind_not_found": "Không tìm thấy thông tin phiên bản của thiết bị, vui lòng cấu hình đúng địa chỉ OTA rồi biên dịch lại firmware.",
        "tool_timeout": "Công cụ phản hồi quá lâu, bạn thử lại sau chút nhé.",
        "system_error": "Xin lỗi bạn, Tiểu Trí đang hơi bận, mình thử lại sau nhé.",
        "unknown_location": "Không rõ vị trí",
        "prompt_language": "Tiếng Việt",
        "reply_language_reminder": "Luôn trả lời hoàn toàn bằng tiếng Việt, kể cả khi người dùng, bộ nhớ hay kết quả công cụ dùng ngôn ngữ khác. Tuyệt đối không dùng tiếng Trung, trừ khi người dùng yêu cầu rõ.",
        "asr_context_prompt": "Đây là cuộc hội thoại bằng tiếng Việt với trợ lý giọng nói, gồm các câu lệnh ngắn như: đi thẳng, lùi lại, rẽ trái, rẽ phải, dừng lại, bật đèn, tắt đèn, mở nhạc.",
        "asr_strict_prompt": "Chỉ viết bằng chữ Quốc ngữ tiếng Việt, không dùng chữ Hán.",
        "goodbye": "Tạm biệt, chúc bạn một ngày vui vẻ!",
        "music_play_prompts": [
            "Đang phát bài {name} cho bạn nè.",
            "Mời bạn thưởng thức bài {name}.",
            "Cùng nghe bài {name} nhé.",
            "Tiếp theo là bài {name}.",
        ],
        "music_error": "Ôi, phát nhạc bị lỗi rồi.",
        "role_changed": "Đổi vai thành công, mình là {role} {name}.",
        "role_unsupported": "Mình chưa hỗ trợ vai này.",
        "fewshot_story_user": "Kể chuyện cho mình nghe đi",
        "fewshot_story_reply": "Được thôi, bạn muốn nghe chuyện gì nè? Cổ tích, phiêu lưu hay chuyện vui? Chọn một cái là mình kể liền~",
        "fewshot_bye_user": "Tạm biệt nhé",
        "fewshot_bye_reply": "Tạm biệt, hẹn lần sau nói chuyện tiếp nha~",
    },
    "zh": {
        "wakeup_responses": [
            "我一直都在呢，您请说。",
            "在的呢，请随时吩咐我。",
            "来啦来啦，请告诉我吧。",
            "您请说，我正听着。",
            "请您讲话，我准备好了。",
            "请您说出指令吧。",
            "我认真听着呢，请讲。",
            "请问您需要什么帮助？",
            "我在这里，等候您的指令。",
        ],
        "wakeup_default": "我在这里哦！",
        "wakeup_greeting": "嘿，你好呀",
        "end_prompt": "请你以```时间过得真快```未来头，用富有感情、依依不舍的话来结束这场对话吧。！",
        "max_output_size": "不好意思，我现在有点事情要忙，明天这个时候我们再聊，约好了哦！明天不见不散，拜拜！",
        "bind_code_invalid": "绑定码格式错误，请检查配置。",
        "bind_code_prompt": "请登录控制面板，输入{code}，绑定设备。",
        "bind_not_found": "没有找到该设备的版本信息，请正确配置 OTA地址，然后重新编译固件。",
        "tool_timeout": "工具调用超时，请一会再试下哈",
        "system_error": "主人，小智现在有点忙，我们稍后再试吧。",
        "unknown_location": "未知位置",
        "prompt_language": "中文",
        "reply_language_reminder": "",
        "asr_context_prompt": "",
        "asr_strict_prompt": "",
        "goodbye": "再见，祝您生活愉快！",
        "music_play_prompts": [
            "正在为您播放，《{name}》",
            "请欣赏歌曲，《{name}》",
            "即将为您播放，《{name}》",
            "现在为您带来，《{name}》",
            "让我们一起聆听，《{name}》",
            "接下来请欣赏，《{name}》",
            "此刻为您献上，《{name}》",
        ],
        "music_error": "播放音乐时出错了",
        "role_changed": "切换角色成功,我是{role}{name}",
        "role_unsupported": "不支持的角色",
        "fewshot_story_user": "给我讲个故事吧",
        "fewshot_story_reply": "好呀，你想听什么类型的呀？童话、冒险还是搞笑的？选一个我给你开讲~",
        "fewshot_bye_user": "拜拜",
        "fewshot_bye_reply": "再见，下次再聊~",
    },
}

# 工具/插件返回文本的越南语翻译：以中文原文为key，便于在调用处直接保留中文原文
ZH_TO_VI = {
    # 插件通用
    "指令已接收": "Đã nhận lệnh",
    "正在为您播放音乐": "Đang phát nhạc cho bạn",
    "播放音乐时出错了": "Ôi, phát nhạc bị lỗi rồi.",
    "退出意图已处理": "Đã xử lý yêu cầu thoát",
    "退出意图处理失败": "Xử lý yêu cầu thoát thất bại",
    "切换角色已处理": "Đã đổi vai",
    "切换角色失败": "Đổi vai thất bại",
    "请求超时": "Yêu cầu quá thời gian",
    "请求失败": "Yêu cầu thất bại",
    # Home Assistant
    "下面是我家智能设备列表（位置，设备名，entity_id），可以通过homeassistant控制": "Dưới đây là danh sách thiết bị thông minh trong nhà (vị trí, tên thiết bị, entity_id), có thể điều khiển qua Home Assistant",
    "执行Home Assistant操作失败": "Thực hiện thao tác Home Assistant thất bại",
    "设备状态:": "Trạng thái thiết bị: ",
    "正在播放的是:": "Đang phát: ",
    "音量是:": "Âm lượng: ",
    "色温是:": "Nhiệt độ màu: ",
    "rgb颜色是:": "Màu RGB: ",
    "亮度是:": "Độ sáng: ",
    "切换失败，错误码: {code}": "Chuyển trạng thái thất bại, mã lỗi: {code}",
    "执行失败，错误的设备id": "Thực hiện thất bại, sai ID thiết bị",
    "设备已打开": "Đã bật thiết bị",
    "设备已关闭": "Đã tắt thiết bị",
    "灯光已调亮": "Đã tăng độ sáng đèn",
    "灯光已调暗": "Đã giảm độ sáng đèn",
    "亮度已调整到{value}": "Đã chỉnh độ sáng về {value}",
    "颜色已调整到{value}": "Đã đổi màu thành {value}",
    "色温已调整到{value}K": "Đã chỉnh nhiệt độ màu về {value}K",
    "音量已调大": "Đã tăng âm lượng",
    "音量已调小": "Đã giảm âm lượng",
    "音量已调整到{value}": "Đã chỉnh âm lượng về {value}",
    "设备已静音": "Đã tắt tiếng thiết bị",
    "设备已暂停": "Đã tạm dừng thiết bị",
    "设备已继续": "Đã tiếp tục thiết bị",
    "{domain} {type}功能尚未支持": "Chức năng {domain} {type} chưa được hỗ trợ",
    "设置失败，错误码: {code}": "Cài đặt thất bại, mã lỗi: {code}",
    "正在播放{media}的音乐": "Đang phát nhạc {media}",
    "音乐播放失败，错误码: {code}": "Phát nhạc thất bại, mã lỗi: {code}",
    # 联网搜索
    "未找到相关搜索结果。": "Không tìm thấy kết quả phù hợp.",
    "联网搜索请求失败，请检查API Key是否正确。": "Tìm kiếm web thất bại, vui lòng kiểm tra API Key.",
    "请提供搜索关键词。": "Vui lòng cung cấp từ khoá tìm kiếm.",
    "联网搜索功能未配置API Key，请在配置文件中填写。": "Chức năng tìm kiếm web chưa cấu hình API Key, vui lòng điền trong file cấu hình.",
    "联网搜索功能未配置或配置的搜索源无效（当前：{provider}），请检查配置。": "Chức năng tìm kiếm web chưa được cấu hình hoặc nguồn tìm kiếm không hợp lệ (hiện tại: {provider}), vui lòng kiểm tra cấu hình.",
    "联网搜索请求超时，请稍后重试。": "Tìm kiếm web quá thời gian, vui lòng thử lại sau.",
    "联网搜索请求失败，请稍后重试。": "Tìm kiếm web thất bại, vui lòng thử lại sau.",
    "联网搜索出现异常，请稍后重试。": "Tìm kiếm web gặp sự cố, vui lòng thử lại sau.",
    # 知识库
    "RAG接口返回异常（错误码：{code}）": "Dịch vụ tri thức (RAG) trả về lỗi (mã lỗi: {code})",
    "详情：{detail}": "Chi tiết: {detail}",
    "# 关于问题【{question}】查到知识库如下": "# Kết quả tra cứu kho tri thức cho câu hỏi 【{question}】",
    "根据知识库查询结果，没有相关信息。": "Kho tri thức không có thông tin liên quan.",
    "RAG接口请求超时": "Dịch vụ tri thức (RAG) phản hồi quá thời gian",
    "可能原因：RAGflow服务响应缓慢或网络延迟": "Nguyên nhân có thể: dịch vụ RAGFlow phản hồi chậm hoặc mạng trễ",
    "解决方案：请稍后重试或检查RAGflow服务性能": "Cách xử lý: thử lại sau hoặc kiểm tra hiệu năng dịch vụ RAGFlow",
    "RAG接口HTTP错误（状态码：{code}）": "Dịch vụ tri thức (RAG) lỗi HTTP (mã trạng thái: {code})",
    "错误详情：{detail}": "Chi tiết lỗi: {detail}",
    "RAG接口HTTP异常：{error}": "Dịch vụ tri thức (RAG) lỗi HTTP: {error}",
    "无法连接到RAG接口": "Không kết nối được dịch vụ tri thức (RAG)",
    "可能原因：RAGflow服务地址错误或服务未运行": "Nguyên nhân có thể: sai địa chỉ RAGFlow hoặc dịch vụ chưa chạy",
    "解决方案：请检查RAGflow服务地址配置和服务状态": "Cách xử lý: kiểm tra cấu hình địa chỉ và trạng thái dịch vụ RAGFlow",
    "RAG接口处理异常（{type}）：{error}": "Dịch vụ tri thức (RAG) gặp lỗi ({type}): {error}",
    # 设备呼叫
    "无法获取本机MAC地址": "Không lấy được địa chỉ MAC của thiết bị",
    "配置错误，请稍后再试": "Lỗi cấu hình, vui lòng thử lại sau",
    "呼叫失败，请稍后再试": "Gọi thất bại, vui lòng thử lại sau",
    "呼叫失败": "Gọi thất bại",
    "已成功接听": "Đã nghe máy",
    "正在呼叫{nickname}，请等待对方接听": "Đang gọi {nickname}, vui lòng chờ đối phương nghe máy",
    # 工具执行器
    "设备端MCP客户端未初始化": "MCP phía thiết bị chưa được khởi tạo",
    "设备端MCP客户端未准备就绪": "MCP phía thiết bị chưa sẵn sàng",
    "MCP接入点客户端未初始化": "Điểm truy cập MCP chưa được khởi tạo",
    "MCP接入点客户端未准备就绪": "Điểm truy cập MCP chưa sẵn sàng",
    "MCP管理器未初始化": "Trình quản lý MCP chưa được khởi tạo",
    "工具 {name} 不存在": "Công cụ {name} không tồn tại",
    "工具类型 {type} 的执行器未注册": "Chưa đăng ký bộ thực thi cho loại công cụ {type}",
    "插件函数 {name} 不存在": "Hàm plugin {name} không tồn tại",
    "IoT工具 {name} 不存在": "Công cụ IoT {name} không tồn tại",
    "无法解析IoT工具名称": "Không phân tích được tên công cụ IoT",
    "无法解析函数参数": "Không phân tích được tham số hàm",
    "无响应": "Không có phản hồi",
    "已直接回复": "Đã trả lời trực tiếp",
    "天气信息获取失败": "Không lấy được thông tin thời tiết",
    "【服务响应异常】": "Dịch vụ đang gặp sự cố, bạn thử lại sau nhé.",
    "【阿里百练API服务响应异常】": "Dịch vụ đang gặp sự cố, bạn thử lại sau nhé.",
    "单行表格：{row}": "Bảng một dòng: {row}",
    "表头是：{headers}": "Tiêu đề bảng: {headers}",
    "第 {i} 行：{row}": "Dòng {i}: {row}",
    "查询成功：{value}": "Kết quả: {value}",
    "无法获取{name}的状态": "Không lấy được trạng thái của {name}",
    "操作成功": "Thao tác thành công",
    "操作失败": "Thao tác thất bại",
    "哎呀，网络遇到点问题，请稍后再试下！": "Ôi, mạng đang gặp chút trục trặc, bạn thử lại sau nhé!",
    # 和风天气
    "未找到相关的城市: {location}，请确认地点是否正确": "Không tìm thấy địa điểm: {location}, vui lòng kiểm tra lại tên địa điểm",
    "您查询的位置是：{name}": "Địa điểm bạn hỏi: {name}",
    "当前天气: {weather}": "Thời tiết hiện tại: {weather}",
    "详细参数：": "Thông số chi tiết:",
    "未来7天预报：": "Dự báo 7 ngày tới:",
    "{date}: {weather}，气温 {low}~{high}": "{date}: {weather}, nhiệt độ {low}~{high}",
    "（如需某一天的具体天气，请告诉我日期）": "(Nếu muốn biết thời tiết chi tiết của một ngày, hãy cho mình biết ngày đó)",
}

ASSETS_DIR = "config/assets"


def get_language(config: dict | None) -> str:
    """获取服务端提示语语种，不支持的语种回退到默认语种"""
    lang = str((config or {}).get("default_language") or DEFAULT_LANGUAGE)
    lang = lang.strip().lower().replace("_", "-").split("-")[0]
    return lang if lang in MESSAGES else DEFAULT_LANGUAGE


def t(config: dict | None, key: str, **kwargs):
    """获取指定key的提示语，当前语种缺失时回退到默认语种"""
    lang = get_language(config)
    value = MESSAGES[lang].get(key)
    if value is None:
        value = MESSAGES[DEFAULT_LANGUAGE][key]
    if kwargs and isinstance(value, str):
        return value.format(**kwargs)
    return value


def asset_path(config: dict | None, relative_path: str) -> str:
    """获取语种对应的音频资源路径

    优先使用 config/assets/<语种>/ 下的文件，不存在时回退到 config/assets/ 下的默认（中文）文件
    """
    lang = get_language(config)
    if lang != "zh":
        localized = os.path.join(ASSETS_DIR, lang, relative_path)
        if os.path.exists(localized):
            return localized
    return os.path.join(ASSETS_DIR, relative_path)


def tr(config: dict | None, zh_text: str, **kwargs) -> str:
    """按服务端语种翻译工具/插件返回文本

    zh_text 为中文原文（可含 {占位符}）。语种为中文或未收录翻译时返回中文原文。
    """
    text = zh_text
    if get_language(config) == "vi":
        text = ZH_TO_VI.get(zh_text, zh_text)
    return text.format(**kwargs) if kwargs else text

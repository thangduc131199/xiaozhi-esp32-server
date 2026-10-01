import random
from bs4 import BeautifulSoup
from config.logger import setup_logging
from plugins_func.register import register_function, ToolType, ActionResponse, Action
from plugins_func.functions.get_news_from_chinanews import (
    fetch_news_from_rss,
    fetch_news_detail,
)
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from core.connection import ConnectionHandler


TAG = __name__
logger = setup_logging()

VNEXPRESS_RSS_BASE = "https://vnexpress.net/rss/"

# 新闻类别关键词 -> VnExpress RSS 频道
CATEGORY_FEEDS = {
    "thoi-su": ["thời sự", "xã hội", "trong nước", "社会", "国内"],
    "the-gioi": ["thế giới", "quốc tế", "国际", "世界"],
    "kinh-doanh": ["kinh doanh", "kinh tế", "tài chính", "财经", "经济", "金融"],
    "the-thao": ["thể thao", "bóng đá", "体育"],
    "khoa-hoc-cong-nghe": ["công nghệ", "khoa học", "số hóa", "科技", "科学"],
    "giai-tri": ["giải trí", "娱乐"],
    "suc-khoe": ["sức khỏe", "sức khoẻ", "y tế", "健康"],
    "giao-duc": ["giáo dục", "học tập", "教育"],
    "tin-moi-nhat": ["mới nhất", "tin mới", "最新"],
}

GET_NEWS_FROM_VNEXPRESS_FUNCTION_DESC = {
    "type": "function",
    "function": {
        "name": "get_news_from_vnexpress",
        "description": (
            "Gọi khi người dùng muốn xem hoặc nghe tin tức Việt Nam (ví dụ: 'đọc tin tức', 'hôm nay có tin gì'). "
            "Người dùng có thể chỉ định chuyên mục: thời sự, thế giới, kinh doanh, thể thao, công nghệ, giải trí, sức khỏe, giáo dục. "
            "Nếu không chỉ định, mặc định đọc tin mới nhất."
        ),
        "parameters": {
            "type": "object",
            "properties": {
                "category": {
                    "type": "string",
                    "description": "Chuyên mục tin tức, ví dụ: thời sự, thế giới, kinh doanh, thể thao, công nghệ. Có thể bỏ trống",
                },
                "detail": {
                    "type": "boolean",
                    "description": "Có lấy nội dung chi tiết của tin vừa đọc hay không, mặc định false",
                },
                "lang": {
                    "type": "string",
                    "description": "Mã ngôn ngữ người dùng đang dùng, ví dụ vi_VN/en_US/zh_CN",
                },
            },
            "required": ["lang"],
        },
    },
}


def map_category(category_text):
    """将用户输入的类别映射到VnExpress RSS频道，无法识别时返回None"""
    if not category_text:
        return None
    normalized = category_text.lower().strip()
    for feed, keywords in CATEGORY_FEEDS.items():
        if normalized == feed or any(keyword in normalized for keyword in keywords):
            return feed
    return None


def clean_description(description):
    """去除RSS描述中的HTML标签（VnExpress描述包含图片链接）"""
    if not description:
        return ""
    return BeautifulSoup(description, "html.parser").get_text(" ", strip=True)


@register_function(
    "get_news_from_vnexpress",
    GET_NEWS_FROM_VNEXPRESS_FUNCTION_DESC,
    ToolType.SYSTEM_CTL,
)
async def get_news_from_vnexpress(
    conn: "ConnectionHandler",
    category: str = None,
    detail: bool = False,
    lang: str = "vi_VN",
):
    """获取VnExpress新闻并随机播报一条，或获取上一条新闻的详细内容"""
    try:
        if detail:
            last_news = getattr(conn, "last_news_link", None) or {}
            link = last_news.get("link")
            title = last_news.get("title", "")
            if not link or link == "#":
                return ActionResponse(
                    Action.REQLLM,
                    "Không tìm thấy tin vừa đọc, hãy lấy một tin tức trước.",
                    None,
                )

            logger.bind(tag=TAG).debug(f"Fetching news details: {title}, URL={link}")
            detail_content = await fetch_news_detail(link)
            if not detail_content or detail_content == "无法获取详细内容":
                return ActionResponse(
                    Action.REQLLM,
                    f"Không lấy được nội dung chi tiết của bài \"{title}\".",
                    None,
                )

            detail_report = (
                f"Dựa vào dữ liệu dưới đây, hãy trả lời yêu cầu xem chi tiết tin tức của người dùng bằng ngôn ngữ {lang}:\n\n"
                f"Tiêu đề: {title}\n"
                f"Nội dung: {detail_content[:3000]}\n\n"
                f"(Hãy tóm tắt ý chính và kể lại tự nhiên, trôi chảy như đang kể một câu chuyện tin tức hoàn chỉnh, "
                f"không nhắc rằng đây là bản tóm tắt)"
            )
            return ActionResponse(Action.REQLLM, detail_report, None)

        news_config = conn.config.get("plugins", {}).get("get_news_from_vnexpress", {})
        base_url = news_config.get("rss_base_url") or VNEXPRESS_RSS_BASE
        default_category = news_config.get("default_category") or "tin-moi-nhat"
        feed = map_category(category) or default_category
        rss_url = f"{base_url}{feed}.rss"

        logger.bind(tag=TAG).info(f"Fetching news: raw category={category}, feed={feed}, URL={rss_url}")

        news_items = await fetch_news_from_rss(rss_url)
        if not news_items:
            return ActionResponse(
                Action.REQLLM, "Xin lỗi, hiện không lấy được tin tức, vui lòng thử lại sau.", None
            )

        selected_news = random.choice(news_items[:20])
        conn.last_news_link = {
            "link": selected_news.get("link", "#"),
            "title": selected_news.get("title", ""),
        }

        news_report = (
            f"Dựa vào dữ liệu dưới đây, hãy trả lời yêu cầu nghe tin tức của người dùng bằng ngôn ngữ {lang}:\n\n"
            f"Tiêu đề: {selected_news['title']}\n"
            f"Thời gian: {selected_news['pubDate']}\n"
            f"Nội dung: {clean_description(selected_news['description'])}\n"
            f"(Hãy đọc tin này một cách tự nhiên, trôi chảy, có thể tóm tắt ngắn gọn, không thêm nội dung thừa. "
            f"Nếu người dùng muốn biết thêm, hãy gợi ý họ nói 'kể chi tiết tin này')"
        )
        return ActionResponse(Action.REQLLM, news_report, None)

    except Exception as e:
        logger.bind(tag=TAG).error(f"Error fetching news: {e}")
        return ActionResponse(
            Action.REQLLM, "Xin lỗi, có lỗi khi lấy tin tức, vui lòng thử lại sau.", None
        )

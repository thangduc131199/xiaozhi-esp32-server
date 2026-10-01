from datetime import datetime
import cnlunar
from plugins_func.register import register_function, ToolType, ActionResponse, Action

get_lunar_function_desc = {
    "type": "function",
    "function": {
        "name": "get_lunar",
        "description": (
            "用于具体日期的阴历/农历和黄历信息。"
            "用户可以指定查询内容，如：阴历日期、天干地支、节气、生肖、星座、八字、宜忌等。"
            "如果没有指定查询内容，则默认查询干支年和农历日期。"
            "对于'今天农历是多少'、'今天农历日期'这样的基本查询，请直接使用context中的信息，不要调用此工具。"
        ),
        "parameters": {
            "type": "object",
            "properties": {
                "date": {
                    "type": "string",
                    "description": "要查询的日期，格式为YYYY-MM-DD，例如2024-01-01。如果不提供，则使用当前日期",
                },
                "query": {
                    "type": "string",
                    "description": "要查询的内容，例如阴历日期、天干地支、节日、节气、生肖、星座、八字、宜忌等",
                },
            },
            "required": [],
        },
    },
}


# 越南语天干地支、生肖、节气
CAN_CN_VI = dict(zip("甲乙丙丁戊己庚辛壬癸", ["Giáp", "Ất", "Bính", "Đinh", "Mậu", "Kỷ", "Canh", "Tân", "Nhâm", "Quý"]))
CHI_CN_VI = dict(zip("子丑寅卯辰巳午未申酉戌亥", ["Tý", "Sửu", "Dần", "Mão", "Thìn", "Tỵ", "Ngọ", "Mùi", "Thân", "Dậu", "Tuất", "Hợi"]))
ZODIAC_VI = ["Chuột", "Trâu", "Hổ", "Mèo", "Rồng", "Rắn", "Ngựa", "Dê", "Khỉ", "Gà", "Chó", "Lợn"]
SOLAR_TERMS_VI = {
    "小寒": "Tiểu Hàn", "大寒": "Đại Hàn", "立春": "Lập Xuân", "雨水": "Vũ Thủy",
    "惊蛰": "Kinh Trập", "春分": "Xuân Phân", "清明": "Thanh Minh", "谷雨": "Cốc Vũ",
    "立夏": "Lập Hạ", "小满": "Tiểu Mãn", "芒种": "Mang Chủng", "夏至": "Hạ Chí",
    "小暑": "Tiểu Thử", "大暑": "Đại Thử", "立秋": "Lập Thu", "处暑": "Xử Thử",
    "白露": "Bạch Lộ", "秋分": "Thu Phân", "寒露": "Hàn Lộ", "霜降": "Sương Giáng",
    "立冬": "Lập Đông", "小雪": "Tiểu Tuyết", "大雪": "Đại Tuyết", "冬至": "Đông Chí",
}
# 越南节日：农历 (月, 日) 与公历 (月, 日)
VN_LUNAR_HOLIDAYS = {
    (1, 1): "Tết Nguyên Đán", (1, 15): "Rằm tháng Giêng (Tết Nguyên Tiêu)",
    (3, 3): "Tết Hàn Thực", (3, 10): "Giỗ Tổ Hùng Vương", (4, 15): "Lễ Phật Đản",
    (5, 5): "Tết Đoan Ngọ", (7, 15): "Lễ Vu Lan", (8, 15): "Tết Trung Thu",
    (12, 23): "Ông Công ông Táo",
}
VN_SOLAR_HOLIDAYS = {
    (1, 1): "Tết Dương lịch", (2, 3): "Ngày thành lập Đảng Cộng sản Việt Nam",
    (2, 14): "Lễ Tình nhân", (3, 8): "Quốc tế Phụ nữ", (4, 30): "Ngày Giải phóng miền Nam",
    (5, 1): "Quốc tế Lao động", (6, 1): "Quốc tế Thiếu nhi", (7, 27): "Ngày Thương binh Liệt sĩ",
    (9, 2): "Quốc khánh", (10, 20): "Ngày Phụ nữ Việt Nam", (11, 20): "Ngày Nhà giáo Việt Nam",
    (12, 22): "Ngày thành lập Quân đội Nhân dân Việt Nam", (12, 24): "Lễ Giáng sinh",
}


def _can_chi_text(gan_zhi: str) -> str:
    """中文干支（如"丙午"）转越南语（如"Bính Ngọ"）"""
    if not gan_zhi or len(gan_zhi) < 2:
        return gan_zhi or ""
    return f"{CAN_CN_VI.get(gan_zhi[0], gan_zhi[0])} {CHI_CN_VI.get(gan_zhi[1], gan_zhi[1])}"


def _vi_lunar_report(now: datetime, query: str) -> str:
    """越南语农历信息（农历日期按越南时区UTC+7计算）"""
    from core.utils import vn_lunar
    from core.utils.current_time import format_vn_lunar_date

    lunar_day, lunar_month, lunar_year, is_leap = vn_lunar.solar_to_lunar(now.day, now.month, now.year)
    lunar = cnlunar.Lunar(now, godType="8char")

    holidays = []
    if not is_leap and (lunar_month, lunar_day) in VN_LUNAR_HOLIDAYS:
        holidays.append(VN_LUNAR_HOLIDAYS[(lunar_month, lunar_day)])
    if (now.month, now.day) in VN_SOLAR_HOLIDAYS:
        holidays.append(VN_SOLAR_HOLIDAYS[(now.month, now.day)])

    today_term = lunar.todaySolarTerms
    today_term = SOLAR_TERMS_VI.get(today_term, "Không có") if today_term != "无" else "Không có"
    next_term = SOLAR_TERMS_VI.get(lunar.nextSolarTerm, lunar.nextSolarTerm)
    next_month, next_day = lunar.nextSolarTermDate

    return (
        f"Dựa vào thông tin dưới đây, hãy trả lời yêu cầu của người dùng về: {query}\n"
        f"Ngày dương lịch: {now.strftime('%d/%m/%Y')}\n"
        f"Âm lịch Việt Nam: {format_vn_lunar_date(now)}\n"
        f"Can Chi: năm {_can_chi_text(lunar.year8Char)}, tháng {_can_chi_text(lunar.month8Char)}, "
        f"ngày {_can_chi_text(lunar.day8Char)}, giờ {_can_chi_text(lunar.twohour8Char)}\n"
        f"Con giáp của năm: {ZODIAC_VI[(lunar_year - 4) % 12]}\n"
        f"Ngày lễ hôm nay: {', '.join(holidays) if holidays else 'Không có'}\n"
        f"Tiết khí hôm nay: {today_term}\n"
        f"Tiết khí tiếp theo: {next_term} (ngày {next_day}/{next_month}/{lunar.nextSolarTermYear})\n"
        "(Mặc định chỉ cần trả lời ngày âm lịch và năm Can Chi; chỉ nói thêm các thông tin khác khi người dùng hỏi)"
    )


@register_function("get_lunar", get_lunar_function_desc, ToolType.SYSTEM_CTL)
def get_lunar(conn, date=None, query=None):
    """
    用于获取当前的阴历/农历，和天干地支、节气、生肖、星座、八字、宜忌等黄历信息
    """
    from core.utils import i18n
    from core.utils.cache.manager import cache_manager, CacheType

    lang = i18n.get_language(getattr(conn, "config", None))

    # 如果提供了日期参数，则使用指定日期；否则使用当前日期
    if date:
        try:
            now = datetime.strptime(date, "%Y-%m-%d")
        except ValueError:
            return ActionResponse(
                Action.REQLLM,
                "Sai định dạng ngày, hãy dùng YYYY-MM-DD, ví dụ 2024-01-01"
                if lang == "vi"
                else "日期格式错误，请使用YYYY-MM-DD格式，例如：2024-01-01",
                None,
            )
    else:
        now = datetime.now()

    current_date = now.strftime("%Y-%m-%d")

    # 如果 query 为 None，则使用默认文本
    if query is None:
        query = "ngày âm lịch và năm Can Chi" if lang == "vi" else "默认查询干支年和农历日期"

    # 尝试从缓存获取农历信息
    lunar_cache_key = f"lunar_info_{lang}_{current_date}"
    cached_lunar_info = cache_manager.get(CacheType.LUNAR, lunar_cache_key)
    if cached_lunar_info:
        return ActionResponse(Action.REQLLM, cached_lunar_info, None)

    if lang == "vi":
        response_text = _vi_lunar_report(now, query)
        cache_manager.set(CacheType.LUNAR, lunar_cache_key, response_text)
        return ActionResponse(Action.REQLLM, response_text, None)

    response_text = f"根据以下信息回应用户的查询请求，并提供与{query}相关的信息：\n"

    lunar = cnlunar.Lunar(now, godType="8char")
    response_text += (
        "农历信息：\n"
        "%s年%s%s\n" % (lunar.lunarYearCn, lunar.lunarMonthCn[:-1], lunar.lunarDayCn)
        + "干支: %s年 %s月 %s日\n" % (lunar.year8Char, lunar.month8Char, lunar.day8Char)
        + "生肖: 属%s\n" % (lunar.chineseYearZodiac)
        + "八字: %s\n"
        % (
            " ".join(
                [lunar.year8Char, lunar.month8Char, lunar.day8Char, lunar.twohour8Char]
            )
        )
        + "今日节日: %s\n"
        % (
            ",".join(
                filter(
                    None,
                    (
                        lunar.get_legalHolidays(),
                        lunar.get_otherHolidays(),
                        lunar.get_otherLunarHolidays(),
                    ),
                )
            )
        )
        + "今日节气: %s\n" % (lunar.todaySolarTerms)
        + "下一节气: %s %s年%s月%s日\n"
        % (
            lunar.nextSolarTerm,
            lunar.nextSolarTermYear,
            lunar.nextSolarTermDate[0],
            lunar.nextSolarTermDate[1],
        )
        + "今年节气表: %s\n"
        % (
            ", ".join(
                [
                    f"{term}({date[0]}月{date[1]}日)"
                    for term, date in lunar.thisYearSolarTermsDic.items()
                ]
            )
        )
        + "生肖冲煞: %s\n" % (lunar.chineseZodiacClash)
        + "星座: %s\n" % (lunar.starZodiac)
        + "纳音: %s\n" % lunar.get_nayin()
        + "彭祖百忌: %s\n" % (lunar.get_pengTaboo(delimit=", "))
        + "值日: %s执位\n" % lunar.get_today12DayOfficer()[0]
        + "值神: %s(%s)\n"
        % (lunar.get_today12DayOfficer()[1], lunar.get_today12DayOfficer()[2])
        + "廿八宿: %s\n" % lunar.get_the28Stars()
        + "吉神方位: %s\n" % " ".join(lunar.get_luckyGodsDirection())
        + "今日胎神: %s\n" % lunar.get_fetalGod()
        + "宜: %s\n" % "、".join(lunar.goodThing[:10])
        + "忌: %s\n" % "、".join(lunar.badThing[:10])
        + "(默认返回干支年和农历日期；仅在要求查询宜忌信息时才返回本日宜忌)"
    )

    # 缓存农历信息
    cache_manager.set(CacheType.LUNAR, lunar_cache_key, response_text)

    return ActionResponse(Action.REQLLM, response_text, None)

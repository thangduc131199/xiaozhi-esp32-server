"""
时间工具模块
提供统一的时间获取功能
"""

import cnlunar
from datetime import datetime
from core.utils import vn_lunar

WEEKDAY_MAP = {
    "Monday": "星期一",
    "Tuesday": "星期二", 
    "Wednesday": "星期三",
    "Thursday": "星期四",
    "Friday": "星期五",
    "Saturday": "星期六",
    "Sunday": "星期日",
}

WEEKDAY_MAP_VI = {
    "Monday": "Thứ Hai",
    "Tuesday": "Thứ Ba",
    "Wednesday": "Thứ Tư",
    "Thursday": "Thứ Năm",
    "Friday": "Thứ Sáu",
    "Saturday": "Thứ Bảy",
    "Sunday": "Chủ Nhật",
}

# 越南语天干地支
CAN_VI = ["Giáp", "Ất", "Bính", "Đinh", "Mậu", "Kỷ", "Canh", "Tân", "Nhâm", "Quý"]
CHI_VI = ["Tý", "Sửu", "Dần", "Mão", "Thìn", "Tỵ", "Ngọ", "Mùi", "Thân", "Dậu", "Tuất", "Hợi"]


def _can_chi_vi(lunar_year: int) -> str:
    """农历年份转越南语干支，如 2026 -> Bính Ngọ"""
    return f"{CAN_VI[(lunar_year - 4) % 10]} {CHI_VI[(lunar_year - 4) % 12]}"


def format_vn_lunar_date(date) -> str:
    """按越南农历（UTC+7）格式化日期，如：ngày 19 tháng 8 năm Bính Ngọ"""
    day, month, year, is_leap = vn_lunar.solar_to_lunar(date.day, date.month, date.year)
    month_text = f"{month} (nhuận)" if is_leap else f"{month}"
    return f"ngày {day} tháng {month_text} năm {_can_chi_vi(year)}"


def get_current_time() -> str:
    """
    获取当前时间字符串 (格式: HH:MM)
    """
    return datetime.now().strftime("%H:%M")


def get_current_date() -> str:
    """
    获取今天日期字符串 (格式: YYYY-MM-DD)
    """
    return datetime.now().strftime("%Y-%m-%d")


def get_current_weekday(lang: str = "zh") -> str:
    """
    获取今天星期几，lang为vi时返回越南语
    """
    now = datetime.now()
    weekday_map = WEEKDAY_MAP_VI if lang == "vi" else WEEKDAY_MAP
    return weekday_map[now.strftime("%A")]


def get_current_lunar_date(lang: str = "zh") -> str:
    """
    获取农历日期字符串，lang为vi时返回越南语（如：ngày 19 tháng 8 năm Bính Ngọ）
    """
    try:
        now = datetime.now()
        if lang == "vi":
            return format_vn_lunar_date(now)
        today_lunar = cnlunar.Lunar(now, godType="8char")
        return "%s年%s%s" % (
            today_lunar.lunarYearCn,
            today_lunar.lunarMonthCn[:-1],
            today_lunar.lunarDayCn,
        )
    except Exception:
        return "Không lấy được ngày âm lịch" if lang == "vi" else "农历获取失败"


def get_current_time_info(lang: str = "zh") -> tuple:
    """
    获取当前时间信息
    返回: (当前时间字符串, 今天日期, 今天星期, 农历日期)
    """
    current_time = get_current_time()
    today_date = get_current_date()
    today_weekday = get_current_weekday(lang)
    lunar_date = get_current_lunar_date(lang)
    
    return current_time, today_date, today_weekday, lunar_date

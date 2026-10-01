"""Tests for core/utils/vn_lunar.py (Vietnamese lunar calendar, UTC+7)."""
from datetime import datetime

from freezegun import freeze_time

from core.utils import current_time
from core.utils.vn_lunar import solar_to_lunar


def test_tet_1985_differs_from_china():
    # 越南1985年春节为1月21日，中国为2月20日
    assert solar_to_lunar(21, 1, 1985) == (1, 1, 1985, False)


def test_tet_2007_one_day_before_china():
    # 越南2007年春节为2月17日，中国为2月18日
    assert solar_to_lunar(17, 2, 2007) == (1, 1, 2007, False)
    assert solar_to_lunar(18, 2, 2007) == (2, 1, 2007, False)


def test_new_moon_before_midnight_vietnam_time():
    # 2020-12-14 朔日在越南时间23:17，中国时间已是次日
    assert solar_to_lunar(14, 12, 2020) == (1, 11, 2020, False)


def test_recent_tet_dates():
    assert solar_to_lunar(29, 1, 2025) == (1, 1, 2025, False)
    assert solar_to_lunar(17, 2, 2026) == (1, 1, 2026, False)


def test_leap_month_2025():
    # 2025年闰六月，越南闰六月初一为7月25日
    assert solar_to_lunar(25, 7, 2025) == (1, 6, 2025, True)


@freeze_time("2026-09-29 10:00:00")
def test_vietnamese_lunar_date_uses_vn_calendar():
    assert current_time.get_current_lunar_date("vi") == "ngày 19 tháng 8 năm Bính Ngọ"


@freeze_time("2020-12-14 10:00:00")
def test_vietnamese_lunar_date_on_divergent_day():
    assert current_time.get_current_lunar_date("vi") == "ngày 1 tháng 11 năm Canh Tý"


def test_get_lunar_vietnamese_report():
    from plugins_func.functions.get_time import get_lunar

    class Conn:
        config = {}

    result = get_lunar(Conn(), date="2026-09-25").result
    assert "ngày 15 tháng 8 năm Bính Ngọ" in result
    assert "Tết Trung Thu" in result
    assert "Con giáp của năm: Ngựa" in result

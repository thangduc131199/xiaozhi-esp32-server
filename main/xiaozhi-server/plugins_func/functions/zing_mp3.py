"""Zing MP3 非官方接口客户端（参考 https://github.com/nvhung9/mp3-api）

签名规则：sig = HMAC_SHA512(secret_key, path + SHA256(按key排序拼接的 "k=v" 参数))
参与签名的参数为 ctime、version，以及接口需要的 id。
"""

import os
import time
import hmac
import hashlib
import random
import httpx
from config.logger import setup_logging

TAG = __name__
logger = setup_logging()

DEFAULT_ZING_CONFIG = {
    "zing_base_url": "https://zingmp3.vn",
    "zing_version": "1.6.34",
    "zing_api_key": "88265e23d4284f25963e6eedac8fbfa3",
    "zing_secret_key": "2aa2d1c561e809b267f3638c4a307aab",
}

CHART_CACHE_SECONDS = 30 * 60
USER_AGENT = (
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
    "(KHTML, like Gecko) Chrome/126.0 Safari/537.36"
)


class ZingMp3Error(Exception):
    pass


class ZingMp3Client:
    def __init__(self, base_url, version, api_key, secret_key):
        self.base_url = base_url.rstrip("/")
        self.version = version
        self.api_key = api_key
        self.secret_key = secret_key
        self._cookies = None
        self._chart_cache = None
        self._chart_time = 0

    @classmethod
    def from_config(cls, config: dict):
        cfg = {k: (config or {}).get(k) or v for k, v in DEFAULT_ZING_CONFIG.items()}
        return cls(
            cfg["zing_base_url"],
            cfg["zing_version"],
            cfg["zing_api_key"],
            cfg["zing_secret_key"],
        )

    def _sign(self, path, params):
        joined = "".join(f"{k}={params[k]}" for k in sorted(params))
        digest = hashlib.sha256(joined.encode("utf-8")).hexdigest()
        return hmac.new(
            self.secret_key.encode("utf-8"),
            (path + digest).encode("utf-8"),
            hashlib.sha512,
        ).hexdigest()

    async def _ensure_cookies(self, client, refresh=False):
        if self._cookies is None or refresh:
            resp = await client.get(self.base_url)
            self._cookies = dict(resp.cookies)

    async def _request(self, path, query=None, sign_params=None):
        query = dict(query or {})
        ctime = str(int(time.time()))
        signed = dict(sign_params or {}, ctime=ctime, version=self.version)
        query.update(
            ctime=ctime,
            version=self.version,
            apiKey=self.api_key,
            sig=self._sign(path, signed),
        )
        async with httpx.AsyncClient(
            timeout=httpx.Timeout(10.0, connect=5.0),
            headers={"User-Agent": USER_AGENT},
            follow_redirects=True,
        ) as client:
            data = None
            for attempt in range(2):
                # 首次失败时刷新cookie再试一次
                await self._ensure_cookies(client, refresh=attempt > 0)
                resp = await client.get(
                    self.base_url + path, params=query, cookies=self._cookies
                )
                data = resp.json()
                if data.get("err") == 0:
                    return data.get("data")
            raise ZingMp3Error(f"Zing API {path} error: {data.get('err')} {data.get('msg')}")

    @staticmethod
    def _playable(songs):
        # streamingStatus == 1 为免费可播放，2 为VIP
        return [s for s in songs or [] if s.get("encodeId") and s.get("streamingStatus", 1) == 1]

    async def search_songs(self, keyword):
        data = await self._request("/api/v2/search/multi", {"q": keyword})
        return self._playable((data or {}).get("songs"))

    async def get_stream_url(self, song_id):
        data = await self._request(
            "/api/v2/song/get/streaming", {"id": song_id}, {"id": song_id}
        )
        url = (data or {}).get("128")
        if not url or not str(url).startswith("http"):
            raise ZingMp3Error(f"No 128kbps stream for song {song_id}")
        return url

    async def chart_songs(self):
        if self._chart_cache and time.time() - self._chart_time < CHART_CACHE_SECONDS:
            return self._chart_cache
        data = await self._request("/api/v2/page/get/chart-home")
        items = self._playable(((data or {}).get("RTChart") or {}).get("items"))
        if items:
            self._chart_cache, self._chart_time = items, time.time()
        return items

    async def random_chart_song(self):
        songs = await self.chart_songs()
        if not songs:
            raise ZingMp3Error("Zing chart is empty")
        return random.choice(songs)

    async def download(self, url, dest_path):
        async with httpx.AsyncClient(
            timeout=httpx.Timeout(60.0, connect=5.0),
            headers={"User-Agent": USER_AGENT, "Referer": self.base_url + "/"},
            follow_redirects=True,
        ) as client:
            async with client.stream("GET", url) as resp:
                resp.raise_for_status()
                tmp_path = dest_path + ".part"
                with open(tmp_path, "wb") as f:
                    async for chunk in resp.aiter_bytes(64 * 1024):
                        f.write(chunk)
        os.replace(tmp_path, dest_path)
        return dest_path


_CLIENTS = {}


def get_client(config: dict) -> ZingMp3Client:
    """按配置复用客户端，保留cookie与排行榜缓存"""
    key = tuple((config or {}).get(k) or v for k, v in DEFAULT_ZING_CONFIG.items())
    if key not in _CLIENTS:
        _CLIENTS[key] = ZingMp3Client.from_config(config)
    return _CLIENTS[key]

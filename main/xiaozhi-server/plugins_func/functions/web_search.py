import httpx
from core.utils import i18n
from config.logger import setup_logging
from plugins_func.register import (
    register_function,
    ToolType,
    ActionResponse,
    Action,
)
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from core.connection import ConnectionHandler

TAG = __name__
logger = setup_logging()

_DEFAULT_DESCRIPTION = (
    "联网搜索工具。当用户明确需要联网搜索问题时使用此工具。"
)

WEB_SEARCH_FUNCTION_DESC = {
    "type": "function",
    "function": {
        "name": "web_search",
        "description": _DEFAULT_DESCRIPTION,
        "parameters": {
            "type": "object",
            "properties": {
                "query": {
                    "type": "string",
                    "description": "搜索关键词或问题",
                }
            },
            "required": ["query"],
        },
    },
}


async def _search_metaso(api_key: str, query: str, max_results: int) -> str:
    """调用秘塔搜索API"""
    url = "https://metaso.cn/api/v1/search"
    headers = {
        "Authorization": f"Bearer {api_key}",
        "Content-Type": "application/json",
    }
    payload = {
        "q": query,
        "size": max_results,
        "stream": False,
        "scope": "webpage",
        "includeSummary": True,
        "includeRawContent": False,
        "conciseSnippet": False,
    }
    logger.bind(tag=TAG).debug(f"Metaso search request | URL: {url} | payload: {payload}")
    async with httpx.AsyncClient(timeout=httpx.Timeout(15.0, connect=3.0)) as client:
        response = await client.post(url, json=payload, headers=headers)
    data = response.json()
    logger.bind(tag=TAG).debug(f"Metaso search response | status: {response.status_code}")

    webpages = data.get("webpages", [])
    if not webpages:
        return "未找到相关搜索结果。"

    lines = ["[Web search results]"]
    for i, item in enumerate(webpages, 1):
        title = item.get("title", "Untitled")
        snippet = item.get("summary", "")
        date = item.get("date", "")
        lines.append(f"{i}. Title: {title}")
        if date:
            lines.append(f"   Date: {date}")
        if snippet:
            lines.append(f"   Summary: {snippet}")

    return "\n".join(lines)


async def _search_tavily(api_key: str, query: str, max_results: int) -> str:
    """调用Tavily搜索API"""
    url = "https://api.tavily.com/search"
    headers = {
        "Authorization": f"Bearer {api_key}",
        "Content-Type": "application/json",
    }
    payload = {
        "query": query,
        "max_results": max_results,
        "search_depth": "advanced",
        "include_answer": "advanced",
    }
    logger.bind(tag=TAG).debug(f"Tavily search request | URL: {url} | payload: {payload}")
    async with httpx.AsyncClient(timeout=httpx.Timeout(15.0, connect=3.0)) as client:
        response = await client.post(url, json=payload, headers=headers)
    data = response.json()
    logger.bind(tag=TAG).debug(f"Tavily search response | status: {response.status_code} | data: {data}")

    results = data.get("results", [])
    if not results:
        return "未找到相关搜索结果。"

    answer = data.get("answer", "")
    lines = [f"[Web search results]\nSummary: {answer}"]
    # for i, item in enumerate(results, 1):
    #     title = item.get("title", "Untitled")
    #     summary = item.get("content", "")
    #     lines.append(f"{i}. Title: {title}")
    #     if summary:
    #         lines.append(f"   摘要：{summary}")

    return "\n".join(lines)


async def _search_serply(api_key: str, query: str, max_results: int) -> str:
    """调用Serply搜索API"""
    url = "https://api.serply.io/v1/search"
    headers = {
        "X-Api-Key": api_key,
        "User-Agent": "xiaozhi-esp32-server",
    }
    # Serply单页最多返回10条，且返回条数可能略多于num，需要本地再截断一次
    params = {"q": query, "num": min(max_results, 10)}
    logger.bind(tag=TAG).debug(f"Serply search request | URL: {url} | params: {params}")
    async with httpx.AsyncClient(timeout=httpx.Timeout(15.0, connect=3.0)) as client:
        response = await client.get(url, params=params, headers=headers)
    data = response.json()
    logger.bind(tag=TAG).debug(f"Serply search response | status: {response.status_code}")

    if response.status_code != 200:
        detail = data.get("detail", "") if isinstance(data, dict) else ""
        logger.bind(tag=TAG).error(
            f"Serply search failed | status: {response.status_code} | detail: {detail}"
        )
        return "联网搜索请求失败，请检查API Key是否正确。"

    results = data.get("results", [])
    if not results:
        return "未找到相关搜索结果。"

    lines = ["[Web search results]"]
    for i, item in enumerate(results[:max_results], 1):
        title = item.get("title", "Untitled")
        snippet = item.get("description", "")
        lines.append(f"{i}. Title: {title}")
        if snippet:
            lines.append(f"   Summary: {snippet}")

    return "\n".join(lines)


@register_function("web_search", WEB_SEARCH_FUNCTION_DESC, ToolType.SYSTEM_CTL)
async def web_search(conn: "ConnectionHandler", query: str = None):
    logger.bind(tag=TAG).info(f"web_search called | query={query}")
    if not query:
        return ActionResponse(Action.REQLLM, i18n.tr(conn.config, "请提供搜索关键词。"), None)

    web_search_config = conn.config.get("plugins", {}).get("web_search", {})
    provider = web_search_config.get("provider", "").lower()
    max_results = int(web_search_config.get("max_results", 3))
    logger.bind(tag=TAG).info(f"web_search config | provider={provider} | max_results={max_results} | config_keys={list(web_search_config.keys())}")

    api_key = web_search_config.get("api_key", "")
    if not api_key:
        return ActionResponse(
            Action.REQLLM,
            i18n.tr(conn.config, "联网搜索功能未配置API Key，请在配置文件中填写。"),
            None,
        )

    try:
        if provider == "metaso":
            result_text = await _search_metaso(api_key, query, max_results)
        elif provider == "tavily":
            result_text = await _search_tavily(api_key, query, max_results)
        elif provider == "serply":
            result_text = await _search_serply(api_key, query, max_results)
        else:
            return ActionResponse(
                Action.REQLLM,
                i18n.tr(conn.config, "联网搜索功能未配置或配置的搜索源无效（当前：{provider}），请检查配置。", provider=provider),
                None,
            )
        logger.bind(tag=TAG).info(f"Search results assembled:\n{result_text}")
    except httpx.TimeoutException:
        logger.bind(tag=TAG).error("Web search request timed out")
        result_text = "联网搜索请求超时，请稍后重试。"
    except httpx.HTTPStatusError as e:
        logger.bind(tag=TAG).error(f"Web search request failed: {e}")
        result_text = "联网搜索请求失败，请稍后重试。"
    except Exception as e:
        logger.bind(tag=TAG).error(f"Web search error: {e}")
        result_text = "联网搜索出现异常，请稍后重试。"

    # 搜索子函数返回的固定提示语按语种翻译，搜索结果本身保持不变
    return ActionResponse(Action.REQLLM, i18n.tr(conn.config, result_text), None)

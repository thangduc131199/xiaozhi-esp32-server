import json
import httpx
from core.utils import i18n
from config.logger import setup_logging
from plugins_func.register import register_function, ToolType, ActionResponse, Action
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from core.connection import ConnectionHandler

TAG = __name__
logger = setup_logging()

# 定义基础的函数描述模板
SEARCH_FROM_RAGFLOW_FUNCTION_DESC = {
    "type": "function",
    "function": {
        "name": "search_from_ragflow",
        "description": "从知识库中查询信息",
        "parameters": {
            "type": "object",
            "properties": {"question": {"type": "string", "description": "查询的问题"}},
            "required": ["question"],
        },
    },
}


@register_function(
    "search_from_ragflow", SEARCH_FROM_RAGFLOW_FUNCTION_DESC, ToolType.SYSTEM_CTL
)
async def search_from_ragflow(conn: "ConnectionHandler", question=None):
    # 确保字符串参数正确处理编码
    if question and isinstance(question, str):
        # 确保问题参数是UTF-8编码的字符串
        pass
    else:
        question = str(question) if question is not None else ""

    ragflow_config = conn.config.get("plugins", {}).get("search_from_ragflow", {})
    base_url = ragflow_config.get("base_url", "")
    api_key = ragflow_config.get("api_key", "")
    dataset_ids = ragflow_config.get("dataset_ids", [])

    url = base_url + "/api/v1/retrieval"
    headers = {"Authorization": f"Bearer {api_key}", "Content-Type": "application/json"}

    # 确保payload中的字符串都是UTF-8编码
    payload = {"question": question, "dataset_ids": dataset_ids}

    try:
        # 使用ensure_ascii=False确保JSON序列化时正确处理中文
        async with httpx.AsyncClient(timeout=httpx.Timeout(5.0, connect=3.0), verify=False) as client:
            response = await client.post(url, json=payload, headers=headers)

        # 显式设置响应的编码为utf-8
        response.encoding = "utf-8"

        response.raise_for_status()

        # 先获取文本内容，然后手动处理JSON解码
        response_text = response.text

        result = json.loads(response_text)

        if result.get("code") != 0:
            error_detail = result.get("error", {}).get("detail", "unknown error")
            error_message = result.get("error", {}).get("message", "")
            error_code = result.get("code", "")

            # 安全地记录错误信息
            logger.bind(tag=TAG).error(
                f"RAGFlow API call failed, code: {error_code}, detail: {error_detail}, full response: {result}"
            )

            # 构建详细的错误响应
            error_response = i18n.tr(conn.config, "RAG接口返回异常（错误码：{code}）", code=error_code)

            if error_message:
                error_response += f"：{error_message}"
            if error_detail:
                error_response += "\n" + i18n.tr(conn.config, "详情：{detail}", detail=error_detail)

            return ActionResponse(Action.RESPONSE, None, error_response)

        chunks = result.get("data", {}).get("chunks", [])
        contents = []
        for chunk in chunks:
            content = chunk.get("content", "")
            if content:
                # 安全地处理内容字符串
                if isinstance(content, str):
                    contents.append(content)
                elif isinstance(content, bytes):
                    contents.append(content.decode("utf-8", errors="replace"))
                else:
                    contents.append(str(content))

        if contents:
            # 组织知识库内容为引用模式
            context_text = i18n.tr(conn.config, "# 关于问题【{question}】查到知识库如下", question=question) + "\n"
            context_text += "```\n\n\n".join(contents[:5])
            context_text += "\n```"
        else:
            context_text = i18n.tr(conn.config, "根据知识库查询结果，没有相关信息。")
        return ActionResponse(Action.REQLLM, context_text, None)

    except httpx.TimeoutException as e:
        error_response = i18n.tr(conn.config, "RAG接口请求超时")
        error_response += "\n" + i18n.tr(conn.config, "可能原因：RAGflow服务响应缓慢或网络延迟")
        error_response += "\n" + i18n.tr(conn.config, "解决方案：请稍后重试或检查RAGflow服务性能")
        return ActionResponse(Action.RESPONSE, None, error_response)

    except httpx.HTTPStatusError as e:
        if hasattr(e.response, "status_code"):
            status_code = e.response.status_code
            error_response = i18n.tr(conn.config, "RAG接口HTTP错误（状态码：{code}）", code=status_code)
            try:
                error_detail = e.response.json().get("error", {}).get("message", "")
                if error_detail:
                    error_response += "\n" + i18n.tr(conn.config, "错误详情：{detail}", detail=error_detail)
            except:
                pass
        else:
            error_response = i18n.tr(conn.config, "RAG接口HTTP异常：{error}", error=str(e))
        return ActionResponse(Action.RESPONSE, None, error_response)

    except httpx.HTTPError as e:
        error_response = i18n.tr(conn.config, "无法连接到RAG接口")
        error_response += "\n" + i18n.tr(conn.config, "可能原因：RAGflow服务地址错误或服务未运行")
        error_response += "\n" + i18n.tr(conn.config, "解决方案：请检查RAGflow服务地址配置和服务状态")
        return ActionResponse(Action.RESPONSE, None, error_response)

    except Exception as e:
        # 其他异常
        error_type = type(e).__name__
        logger.bind(tag=TAG).error(
            f"RAGFlow processing error, type: {error_type}, detail: {str(e)}"
        )

        # 提供详细的错误信息
        error_response = i18n.tr(conn.config, "RAG接口处理异常（{type}）：{error}", type=error_type, error=str(e))
        return ActionResponse(Action.RESPONSE, None, error_response)

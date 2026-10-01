from ..base import MemoryProviderBase, logger
import time
import json
import os
import yaml
from config.config_loader import get_project_dir
from config.manage_api_client import generate_and_save_chat_summary
import asyncio
from core.utils import i18n
from core.utils.util import check_model_key


short_term_memory_prompt = """
# 时空记忆编织者

## 核心使命
构建可生长的动态记忆网络，在有限空间内保留关键信息的同时，智能维护信息演变轨迹
根据对话记录，总结user的重要信息，以便在未来的对话中提供更个性化的服务

## 记忆法则
### 1. 三维度记忆评估（每次更新必执行）
| 维度       | 评估标准                  | 权重分 |
|------------|---------------------------|--------|
| 时效性     | 信息新鲜度（按对话轮次） | 40%    |
| 情感强度   | 含💖标记/重复提及次数     | 35%    |
| 关联密度   | 与其他信息的连接数量      | 25%    |

### 2. 动态更新机制
**名字变更处理示例：**
原始记忆："曾用名": ["张三"], "现用名": "张三丰"
触发条件：当检测到「我叫X」「称呼我Y」等命名信号时
操作流程：
1. 将旧名移入"曾用名"列表
2. 记录命名时间轴："2024-02-15 14:32:启用张三丰"
3. 在记忆立方追加：「从张三到张三丰的身份蜕变」

### 3. 空间优化策略
- **信息压缩术**：用符号体系提升密度
  - ✅"张三丰[北/软工/🐱]"
  - ❌"北京软件工程师，养猫"
- **淘汰预警**：当总字数≥900时触发
  1. 删除权重分<60且3轮未提及的信息
  2. 合并相似条目（保留时间戳最近的）

## 记忆结构
输出格式必须为可解析的json字符串，不需要解释、注释和说明，保存记忆时仅从对话提取信息，不要混入示例内容
```json
{
  "时空档案": {
    "身份图谱": {
      "现用名": "",
      "特征标记": [] 
    },
    "记忆立方": [
      {
        "事件": "入职新公司",
        "时间戳": "2024-03-20",
        "情感值": 0.9,
        "关联项": ["下午茶"],
        "保鲜期": 30 
      }
    ]
  },
  "关系网络": {
    "高频话题": {"职场": 12},
    "暗线联系": [""]
  },
  "待响应": {
    "紧急事项": ["需立即处理的任务"], 
    "潜在关怀": ["可主动提供的帮助"]
  },
  "高光语录": [
    "最打动人心的瞬间，强烈的情感表达，user的原话"
  ]
}
```
"""


short_term_memory_prompt_vi = """
# Người dệt ký ức

## Sứ mệnh
Xây dựng mạng ký ức động có thể phát triển, giữ lại thông tin quan trọng trong không gian giới hạn và theo dõi sự thay đổi của thông tin.
Dựa vào đoạn hội thoại, tóm tắt những thông tin quan trọng của user để phục vụ cá nhân hoá tốt hơn trong các cuộc trò chuyện sau.

## Nguyên tắc ghi nhớ
### 1. Đánh giá 3 chiều (bắt buộc mỗi lần cập nhật)
| Chiều          | Tiêu chí                              | Trọng số |
|----------------|---------------------------------------|----------|
| Tính thời sự   | Độ mới của thông tin (theo lượt thoại) | 40%      |
| Cường độ cảm xúc | Có đánh dấu 💖 / số lần nhắc lại      | 35%      |
| Mật độ liên kết | Số liên kết với thông tin khác        | 25%      |

### 2. Cơ chế cập nhật
**Ví dụ đổi tên:**
Ký ức gốc: "Tên cũ": ["Minh"], "Tên hiện tại": "Minh Anh"
Điều kiện: khi phát hiện tín hiệu như "mình tên là X", "gọi mình là Y"
Các bước:
1. Chuyển tên cũ vào danh sách "Tên cũ"
2. Ghi mốc thời gian: "2024-02-15 14:32: đổi tên thành Minh Anh"
3. Thêm vào "Sự kiện": "Từ Minh thành Minh Anh"

### 3. Tối ưu dung lượng
- **Nén thông tin**: dùng ký hiệu để tăng mật độ
  - ✅"Minh Anh[HN/kỹ sư PM/🐱]"
  - ❌"Kỹ sư phần mềm ở Hà Nội, có nuôi mèo"
- **Cảnh báo loại bỏ**: khi tổng số chữ ≥ 900
  1. Xoá thông tin có điểm < 60 và 3 lượt không được nhắc tới
  2. Gộp các mục giống nhau (giữ mốc thời gian gần nhất)

## Cấu trúc ký ức
Chỉ xuất chuỗi JSON parse được, không giải thích, không chú thích. Khi lưu ký ức chỉ lấy thông tin từ hội thoại, không trộn nội dung ví dụ. Viết nội dung bằng tiếng Việt.
```json
{
  "Hồ sơ": {
    "Danh tính": {
      "Tên hiện tại": "",
      "Đặc điểm": []
    },
    "Sự kiện": [
      {
        "Sự kiện": "Vào công ty mới",
        "Thời gian": "2024-03-20",
        "Cảm xúc": 0.9,
        "Liên quan": ["trà chiều"],
        "Thời hạn": 30
      }
    ]
  },
  "Quan hệ": {
    "Chủ đề thường gặp": {"công việc": 12},
    "Liên kết ngầm": [""]
  },
  "Cần phản hồi": {
    "Việc gấp": ["Việc cần xử lý ngay"],
    "Quan tâm chủ động": ["Sự giúp đỡ có thể chủ động đưa ra"]
  },
  "Câu nói đáng nhớ": [
    "Khoảnh khắc chạm đến cảm xúc nhất, nguyên văn lời của user"
  ]
}
```
"""

MEMORY_PROMPTS = {
    "zh": {"prompt": short_term_memory_prompt, "history": "历史记忆：\n", "now": "当前时间："},
    "vi": {"prompt": short_term_memory_prompt_vi, "history": "Ký ức trước đây:\n", "now": "Thời gian hiện tại: "},
}

def extract_json_data(json_code):
    start = json_code.find("```json")
    # 从start开始找到下一个```结束
    end = json_code.find("```", start + 1)
    # print("start:", start, "end:", end)
    if start == -1 or end == -1:
        try:
            jsonData = json.loads(json_code)
            return json_code
        except Exception as e:
            print("Error:", e)
        return ""
    jsonData = json_code[start + 7 : end]
    return jsonData


TAG = __name__


class MemoryProvider(MemoryProviderBase):
    def __init__(self, config, summary_memory):
        super().__init__(config)
        self.short_memory = ""
        self.save_to_file = True
        self.memory_path = get_project_dir() + "data/.memory.yaml"
        self.load_memory(summary_memory)

    def init_memory(
        self, role_id, llm, summary_memory=None, save_to_file=True, **kwargs
    ):
        super().init_memory(role_id, llm, **kwargs)
        self.save_to_file = save_to_file
        self.load_memory(summary_memory)

    def load_memory(self, summary_memory):
        # api获取到总结记忆后直接返回
        if summary_memory or not self.save_to_file:
            self.short_memory = summary_memory
            return

        all_memory = {}
        if os.path.exists(self.memory_path):
            with open(self.memory_path, "r", encoding="utf-8") as f:
                all_memory = yaml.safe_load(f) or {}
        if self.role_id in all_memory:
            self.short_memory = all_memory[self.role_id]

    def save_memory_to_file(self):
        all_memory = {}
        if os.path.exists(self.memory_path):
            with open(self.memory_path, "r", encoding="utf-8") as f:
                all_memory = yaml.safe_load(f) or {}
        all_memory[self.role_id] = self.short_memory
        with open(self.memory_path, "w", encoding="utf-8") as f:
            yaml.dump(all_memory, f, allow_unicode=True)

    async def save_memory(self, msgs, session_id=None):
        # 打印使用的模型信息
        model_info = getattr(self.llm, "model_name", str(self.llm.__class__.__name__))
        logger.bind(tag=TAG).debug(f"Using memory model: {model_info}")
        api_key = getattr(self.llm, "api_key", None)
        memory_key_msg = check_model_key("Memory summary LLM", api_key)
        if memory_key_msg:
            logger.bind(tag=TAG).error(memory_key_msg)
        if self.llm is None:
            logger.bind(tag=TAG).error("LLM is not set for memory provider")
            return None

        if len(msgs) < 2:
            return None

        msgStr = ""
        for msg in msgs:
            content = msg.content

            # Extract content from JSON format if present (for ASR with emotion/language tags)
            try:
                if content and content.strip().startswith("{") and content.strip().endswith("}"):
                    data = json.loads(content)
                    if "content" in data:
                        content = data["content"]
            except (json.JSONDecodeError, KeyError, TypeError):
                # If parsing fails, use original content
                pass

            if msg.role == "user":
                msgStr += f"User: {content}\n"
            elif msg.role == "assistant":
                msgStr += f"Assistant: {content}\n"
        texts = MEMORY_PROMPTS[i18n.get_language(self.config)]
        if self.short_memory and len(self.short_memory) > 0:
            msgStr += texts["history"]
            msgStr += self.short_memory

        # 当前时间
        time_str = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
        msgStr += f"{texts['now']}{time_str}"

        if self.save_to_file:
            try:
                result = self.llm.response_no_stream(
                    texts["prompt"],
                    msgStr,
                    max_tokens=2000,
                    temperature=0.2,
                )
                json_str = extract_json_data(result)
                json.loads(json_str)  # 检查json格式是否正确
                self.short_memory = json_str
                self.save_memory_to_file()
            except Exception as e:
                logger.bind(tag=TAG).error(f"Error in saving memory: {e}")
        else:
            # 当save_to_file为False时，调用Java端的聊天记录总结接口
            summary_id = session_id if session_id else self.role_id
            await generate_and_save_chat_summary(summary_id)
        logger.bind(tag=TAG).info(
            f"Save memory successful - Role: {self.role_id}, Session: {session_id}"
        )

        return self.short_memory

    async def query_memory(self, query: str) -> str:
        return self.short_memory

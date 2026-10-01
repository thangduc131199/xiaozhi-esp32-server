import os
import re
import time
import random
import difflib
import traceback
from pathlib import Path
from core.utils import i18n
from core.providers.tts.dto.dto import TTSMessageDTO, SentenceType, ContentType
from plugins_func.register import register_function, ToolType, ActionResponse, Action
from plugins_func.functions.zing_mp3 import get_client
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from core.connection import ConnectionHandler

TAG = __name__

MUSIC_CACHE = {}

# Zing MP3 下载缓存目录（不能放在 tmp/ 下，TTS 播放完会删除 tmp/ 中的文件）
ZING_CACHE_DIR = os.path.abspath("./cache/zing_music")
ZING_CACHE_MAX_FILES = 50

play_music_function_desc = {
    "type": "function",
    "function": {
        "name": "play_music",
        "description": "Call when the user wants to play music or a song.",
        "parameters": {
            "type": "object",
            "properties": {
                "song_name": {
                    "type": "string",
                    "description": "Song title as the user said it, may include the artist (e.g. 'Lạc trôi Sơn Tùng', 'Con cò bé bé'). Use 'random' if the user did not name a specific song.",
                }
            },
            "required": ["song_name"],
        },
    },
}


@register_function("play_music", play_music_function_desc, ToolType.SYSTEM_CTL)
async def play_music(conn: "ConnectionHandler", song_name: str):
    try:
        music_intent = (
            f"播放音乐 {song_name}" if song_name != "random" else "随机播放音乐"
        )
        played = await handle_music_command(conn, music_intent)
        if not played:
            return ActionResponse(
                action=Action.RESPONSE, result="no music played", response=i18n.t(conn.config, "music_error")
            )
        return ActionResponse(
            action=Action.RECORD,
            result=f"{i18n.tr(conn.config, '指令已接收')}: {played}",
            response=i18n.tr(conn.config, "正在为您播放音乐"),
        )
    except Exception as e:
        conn.logger.bind(tag=TAG).error(f"Error handling music intent: {e}")
        return ActionResponse(
            action=Action.RESPONSE, result=str(e), response=i18n.t(conn.config, "music_error")
        )


def _extract_song_name(text):
    """从用户输入中提取歌名"""
    for keyword in ["播放音乐"]:
        if keyword in text:
            parts = text.split(keyword)
            if len(parts) > 1:
                return parts[1].strip()
    return None


def _find_best_match(potential_song, music_files):
    """查找最匹配的歌曲"""
    best_match = None
    highest_ratio = 0

    for music_file in music_files:
        song_name = os.path.splitext(music_file)[0]
        ratio = difflib.SequenceMatcher(None, potential_song, song_name).ratio()
        if ratio > highest_ratio and ratio > 0.4:
            highest_ratio = ratio
            best_match = music_file
    return best_match


def get_music_files(music_dir, music_ext):
    music_dir = Path(music_dir)
    music_files = []
    music_file_names = []
    for file in music_dir.rglob("*"):
        # 判断是否是文件
        if file.is_file():
            # 获取文件扩展名
            ext = file.suffix.lower()
            # 判断扩展名是否在列表中
            if ext in music_ext:
                # 添加相对路径
                music_files.append(str(file.relative_to(music_dir)))
                music_file_names.append(
                    os.path.splitext(str(file.relative_to(music_dir)))[0]
                )
    return music_files, music_file_names


def initialize_music_handler(conn: "ConnectionHandler"):
    global MUSIC_CACHE
    if MUSIC_CACHE == {}:
        plugins_config = conn.config.get("plugins", {})
        if "play_music" in plugins_config:
            MUSIC_CACHE["music_config"] = plugins_config["play_music"]
            MUSIC_CACHE["music_dir"] = os.path.abspath(
                MUSIC_CACHE["music_config"].get("music_dir", "./music")  # 默认路径修改
            )
            MUSIC_CACHE["music_ext"] = MUSIC_CACHE["music_config"].get(
                "music_ext", (".mp3", ".wav", ".p3")
            )
            MUSIC_CACHE["refresh_time"] = MUSIC_CACHE["music_config"].get(
                "refresh_time", 60
            )
        else:
            MUSIC_CACHE["music_dir"] = os.path.abspath("./music")
            MUSIC_CACHE["music_ext"] = (".mp3", ".wav", ".p3")
            MUSIC_CACHE["refresh_time"] = 60
        # 获取音乐文件列表
        MUSIC_CACHE["music_files"], MUSIC_CACHE["music_file_names"] = get_music_files(
            MUSIC_CACHE["music_dir"], MUSIC_CACHE["music_ext"]
        )
        MUSIC_CACHE["scan_time"] = time.time()
    return MUSIC_CACHE


async def handle_music_command(conn: "ConnectionHandler", text):
    initialize_music_handler(conn)
    global MUSIC_CACHE

    """处理音乐播放指令，返回实际播放的歌曲名，未播放返回None"""
    clean_text = re.sub(r"[^\w\s]", "", text).strip()
    conn.logger.bind(tag=TAG).debug(f"Checking whether this is a music command: {clean_text}")
    potential_song = _extract_song_name(clean_text)

    music_config = conn.config.get("plugins", {}).get("play_music") or {}
    if str(music_config.get("source") or "zing").strip().lower() == "zing":
        played = await play_zing_music(conn, music_config, potential_song)
        if played:
            return played

    # 尝试匹配具体歌名
    if os.path.exists(MUSIC_CACHE["music_dir"]):
        if time.time() - MUSIC_CACHE["scan_time"] > MUSIC_CACHE["refresh_time"]:
            # 刷新音乐文件列表
            MUSIC_CACHE["music_files"], MUSIC_CACHE["music_file_names"] = (
                get_music_files(MUSIC_CACHE["music_dir"], MUSIC_CACHE["music_ext"])
            )
            MUSIC_CACHE["scan_time"] = time.time()

        if potential_song:
            best_match = _find_best_match(potential_song, MUSIC_CACHE["music_files"])
            if best_match:
                conn.logger.bind(tag=TAG).info(f"Best matching song: {best_match}")
                return await play_local_music(conn, specific_file=best_match)
    # 检查是否是通用播放音乐命令
    return await play_local_music(conn)


def _get_random_play_prompt(song_name, config=None):
    """生成随机播放引导语（song_name 已不含扩展名）"""
    # 直接使用random.choice，不设置seed
    return random.choice(i18n.t(config, "music_play_prompts")).format(name=song_name)


async def play_local_music(conn: "ConnectionHandler", specific_file=None):
    global MUSIC_CACHE
    """播放本地音乐文件"""
    try:
        if not os.path.exists(MUSIC_CACHE["music_dir"]):
            conn.logger.bind(tag=TAG).error(
                f"Music directory does not exist: " + MUSIC_CACHE["music_dir"]
            )
            return

        # 确保路径正确性
        if specific_file:
            selected_music = specific_file
            music_path = os.path.join(MUSIC_CACHE["music_dir"], specific_file)
        else:
            if not MUSIC_CACHE["music_files"]:
                conn.logger.bind(tag=TAG).error("No MP3 music files found")
                return
            selected_music = random.choice(MUSIC_CACHE["music_files"])
            music_path = os.path.join(MUSIC_CACHE["music_dir"], selected_music)

        if not os.path.exists(music_path):
            conn.logger.bind(tag=TAG).error(f"Selected music file does not exist: {music_path}")
            return
        song_name = os.path.splitext(selected_music)[0]
        _enqueue_music(conn, song_name, music_path)
        return song_name

    except Exception as e:
        conn.logger.bind(tag=TAG).error(f"Failed to play music: {str(e)}")
        conn.logger.bind(tag=TAG).error(f"Error details: {traceback.format_exc()}")


def _enqueue_music(conn: "ConnectionHandler", song_name, music_path):
    """播放引导语后播放音乐文件"""
    text = _get_random_play_prompt(song_name, conn.config)
    conn.tts.store_tts_text(conn.sentence_id, text)
    # conn.dialogue.put(Message(role="assistant", content=text))

    if conn.intent_type == "intent_llm":
        conn.tts.tts_text_queue.put(
            TTSMessageDTO(
                sentence_id=conn.sentence_id,
                sentence_type=SentenceType.FIRST,
                content_type=ContentType.ACTION,
            )
        )
    conn.tts.tts_text_queue.put(
        TTSMessageDTO(
            sentence_id=conn.sentence_id,
            sentence_type=SentenceType.MIDDLE,
            content_type=ContentType.TEXT,
            content_detail=text,
        )
    )
    conn.tts.tts_text_queue.put(
        TTSMessageDTO(
            sentence_id=conn.sentence_id,
            sentence_type=SentenceType.MIDDLE,
            content_type=ContentType.FILE,
            content_file=music_path,
        )
    )
    if conn.intent_type == "intent_llm":
        conn.tts.tts_text_queue.put(
            TTSMessageDTO(
                sentence_id=conn.sentence_id,
                sentence_type=SentenceType.LAST,
                content_type=ContentType.ACTION,
            )
        )


def _prune_zing_cache():
    """只保留最近的若干首缓存歌曲"""
    try:
        files = [
            os.path.join(ZING_CACHE_DIR, f)
            for f in os.listdir(ZING_CACHE_DIR)
            if f.endswith(".mp3")
        ]
        files.sort(key=os.path.getmtime, reverse=True)
        for f in files[ZING_CACHE_MAX_FILES:]:
            os.remove(f)
    except Exception:
        pass


async def play_zing_music(conn: "ConnectionHandler", music_config, song_name=None):
    """从 Zing MP3 搜索/随机挑选歌曲，下载后播放；失败返回None以便回退本地音乐"""
    try:
        client = get_client(music_config)
        if song_name and song_name.lower() != "random":
            songs = await client.search_songs(song_name)
            if not songs:
                conn.logger.bind(tag=TAG).warning(f"Zing: no playable song found for: {song_name}")
                return None
            song = songs[0]
        else:
            song = await client.random_chart_song()

        song_id = song["encodeId"]
        display_name = f"{song.get('title', '')} - {song.get('artistsNames', '')}".strip(" -")
        conn.logger.bind(tag=TAG).info(f"Zing song selected: {display_name} ({song_id})")

        os.makedirs(ZING_CACHE_DIR, exist_ok=True)
        music_path = os.path.join(ZING_CACHE_DIR, f"{song_id}.mp3")
        if os.path.exists(music_path) and os.path.getsize(music_path) > 0:
            os.utime(music_path)
        else:
            stream_url = await client.get_stream_url(song_id)
            await client.download(stream_url, music_path)
            _prune_zing_cache()

        _enqueue_music(conn, display_name, music_path)
        return display_name
    except Exception as e:
        conn.logger.bind(tag=TAG).error(f"Zing music failed, falling back to local music: {e}")
        return None

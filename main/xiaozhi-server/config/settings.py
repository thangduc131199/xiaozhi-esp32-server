import os
import asyncio
from config.config_loader import read_config, get_project_dir, load_config


default_config_file = "config.yaml"
config_file_valid = False


def check_config_file():
    global config_file_valid
    if config_file_valid:
        return
    """
    简化的配置检查，仅提示用户配置文件的使用情况
    """
    custom_config_file = get_project_dir() + "data/." + default_config_file
    if not os.path.exists(custom_config_file):
        raise FileNotFoundError(
            "data/.config.yaml not found, please follow the tutorial to make sure this config file exists"
        )

    # 检查是否从API读取配置
    config = asyncio.run(load_config())
    if config.get("read_config_from_api", False):
        print("Reading config from API")
        old_config_origin = read_config(custom_config_file)
        if old_config_origin.get("selected_module") is not None:
            error_msg = "Your config seems to contain both manager console settings and local settings:\n"
            error_msg += "\nSuggestions:\n"
            error_msg += "1. Copy config_from_api.yaml from the root directory into data/ and rename it to .config.yaml\n"
            error_msg += "2. Configure the API address and secret following the tutorial\n"
            raise ValueError(error_msg)
    config_file_valid = True

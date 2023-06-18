🐣 Please follow me for new updates https://twitter.com/camenduru <br />
🔥 Please join our discord server https://discord.gg/k5BwmmvJJU

🐣 请关注我以获取最新消息 https://twitter.com/camenduru <br />
🔥 请加入我们的 Discord 服务器 https://discord.gg/k5BwmmvJJU

## Main Repo
https://github.com/Jeffreytsai1004/stable-diffusion-webui/tree/portable

## 主要回购
https://github.com/Jeffreytsai1004/stable-diffusion-webui/tree/portable

## Stable Diffusion WebUI Portable
This Project Aims for 100% Offline Stable Diffusion (People without internet or with slow internet can get it via USB or HD-DVD)

## Stable Diffusion WebUI 便携版本
本项目旨在实现 100% 离线的 Stable Diffusion（没有网络或网络速度较慢的人可以通过 USB 或 HD-DVD 获取）

## Preparation Guide
- Download repo zip file extract
- Run install.bat
- The basic model and basic plug-in have been built in and will be downloaded automatically
- Test with run.bat
- Delete install.bat and pkgs folder
- Zip 
- Share 🎉

## 部署指南
- 下载 repo zip 文件解压
- 运行install.bat
- 已内置基础模型和基础插件,将自动下载
- 使用 run.bat 进行测试
- 删除 install.bat 和 pkgs 文件夹
- 压缩zip文件
- 分享🎉

## Optional
- Edit interrogate.py (If you want to use Interrogate CLIP feature)
  - Open stable-diffusion-webui\modules\interrogate.py 
  - Add `from modules.paths import script_path` line after `from modules import devices, paths, lowvram` line
  - Find `model, preprocess = clip.load(clip_model_name)` 
  - Change to `model, preprocess = clip.load(name=clip_model_name, download_root=os.path.join(script_path, 'cache/clip'))`

## 可选项
- 编辑 interrogate.py（如果你想使用 Interrogate CLIP 功能）
    - 打开 stable-diffusion-webui\modules\interrogate.py
    - 在`from modules import devices, paths, lowvram`行之后添加`from modules.paths import script_path`行
    - 找到`model, preprocess = clip.load(clip_model_name)`
    - 更改为`model, preprocess = clip.load(name=clip_model_name, download_root=os.path.join(script_path, 'cache/clip'))`


micromamba.exe from https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html

micromamba.exe 来自 https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html

Example Project: https://camenduru.itch.io/stable-diffusion-webui

示例项目: https://camenduru.itch.io/stable-diffusion-webui

## Example Project Preparation (Youtube Video)
[![How to Use Stable Diffusion Webui Colab](https://i.imgur.com/Zi3LsXj.jpg)](https://www.youtube.com/watch?v=PHZ0VC_Losk)

## Example Project Preparation (Youtube Video)
[![如何使用 Stable Diffusion Webui Colab](https://i.imgur.com/Zi3LsXj.jpg)](https://www.youtube.com/watch?v=PHZ0VC_Losk)

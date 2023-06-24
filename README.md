## 原始版本
https://github.com/camenduru/stable-diffusion-webui-portable
## 拉取版本
`git clone -b automatic1111 https://github.com/Jeffreytsai1004/stable-diffusion-webui-portable .\`

🐣 请关注我以获取最新消息 https://twitter.com/camenduru <br />
🔥 请加入我们的 Discord 服务器 https://discord.gg/k5BwmmvJJU

## Stable Diffusion WebUI 便携版本
本项目旨在实现 100% 离线的 Stable Diffusion（没有网络或网络速度较慢的人可以通过 USB 或 HD-DVD 获取）

## 版本
- VERSION SETTING:
-     SDDEPOT                  `https://github.com/AUTOMATIC1111/stable-diffusion-webui/`
-     BRANCH                   `master`
-     PYTHON_VERSION           `3.10.11`
-     GIT_VERSION              `2.41.0`
-     GITLFS_VERSION           `3.2.0`
-     TORCH_VERSION            `2.0.1+cu118`
-     TORCH_VERSION            `2.0.2+cu118`
-     TORCH_VERSION            `0.15.2+cu118`
-     XFROMERS_VERSION         `0.0.20`

## 更新内容
- 使用`micromamba`代替`conda`，大幅度减少依赖包的体积
- 使用AUTOMATIC1111的仓库，对应的参数在启动配置中修改，无需单独修改
- 升级Torch为`2.0.1`版本，现在可以使用`CUDA 11.8`
- 弃用xformers，改用`--opt-sdp-attention`参数启动，速度更快
- 对应的Python推荐使用`3.10.11`版本
- 可自定修改插件版本和仓库位置变量，以实现完全离线运行
- 添加了基础模型自动下载，在`install.bat`中Clone模块可自行添加下载内容
- 对应的WebUI中`Launch.py`文件中需修改对应的仓库依赖

## 部署指南
- 安装`CUDA 11.8`，下载地址：`https://developer.nvidia.com/cuda-11-8-0-download-archive`
- 下载仓库 zip 文件解压
- 运行`install.bat`
- 已内置基础模型和基础插件,将自动下载
- 使用 `run.bat` 进行测试
- 测试使用公共，注意ControlNet以及其他通用性的插件依赖可在联网的状态下运行与测试，建议及时保存Setting配置文件
- 删除 `install.bat` 和 `pkgs` 文件夹
- 压缩zip文件
- 分享🎉

## 可选项
- 编辑 interrogate.py（如果你想使用 Interrogate CLIP 功能）
    - 打开 stable-diffusion-webui\modules\interrogate.py
    - 在`from modules import devices, paths, lowvram`行之后添加`from modules.paths import script_path`行
    - 找到`model, preprocess = clip.load(clip_model_name)`
    - 更改为`model, preprocess = clip.load(name=clip_model_name, download_root=os.path.join(script_path, 'cache/clip'))`

micromamba.exe 来自 https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html

示例项目: https://camenduru.itch.io/stable-diffusion-webui

## 示例项目（Youtube 视频）
[![How to Use Stable Diffusion Webui Colab](https://i.imgur.com/Zi3LsXj.jpg)](https://www.youtube.com/watch?v=PHZ0VC_Losk)

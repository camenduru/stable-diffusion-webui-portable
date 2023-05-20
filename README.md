🐣请关注我以获取新的更新 [https://twitter.com/camenduru](https://twitter.com/camenduru)  
🔥请加入我们的不和谐服务器 [https://discord.gg/k5BwmmvJJU](https://discord.gg/k5BwmmvJJU)

## [](https://github.com/camenduru/stable-diffusion-webui-portable#main-repo)主仓库

[https://github.com/camenduru/stable-diffusion-webui/tree/v2.2](https://github.com/camenduru/stable-diffusion-webui/tree/v2.2)

## [](https://github.com/camenduru/stable-diffusion-webui-portable#stable-diffusion-webui-portable)Stable Diffusion WebUI便携式

该项目旨在实现100%离线稳定扩散（没有互联网或互联网速度慢的人可以通过USB或HD-DVD获得）

## [](https://github.com/camenduru/stable-diffusion-webui-portable#preparation-guide)准备指南

-   下载存储库压缩文件提取
-   运行安装.bat
-   下载所有模型并放入稳定扩散网络\\模型\\稳定扩散文件夹
-   通过run.bat进行测试
-   删除安装.bat和 pkgs 文件夹
-   压缩
-   共享🎉

## [](https://github.com/camenduru/stable-diffusion-webui-portable#optional)自选

-   编辑 interrogate.py（如果要使用询问剪辑功能）
    -   打开Stable Diffusion的 interrogate.py 模块
    -   一行又一行地添加 `from modules.paths import script_path` `from modules import devices, paths, lowvram`
    -   找到 `model, preprocess = clip.load(clip_model_name)`
    -   更改为 `model, preprocess = clip.load(name=clip_model_name, download_root=os.path.join(script_path, 'cache/clip'))`

micromamba.exe： [https://mamba.readthedocs.io/en/latest/user\_guide/micromamba.html](https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html)

示例项目：[https://camenduru.itch.io/stable-diffusion-webui](https://camenduru.itch.io/stable-diffusion-webui)

## [](https://github.com/camenduru/stable-diffusion-webui-portable#example-project-preparation-youtube-video)项目部署示例

[![如何使用Stable Diffusion Webui Colab](https://camo.githubusercontent.com/c9e71ef834415205dd3215b90034832cad9d1b28cf25c8a5b88c99a94ab2f665/68747470733a2f2f692e696d6775722e636f6d2f5a69334c73586a2e6a7067)](https://www.youtube.com/watch?v=PHZ0VC_Losk)

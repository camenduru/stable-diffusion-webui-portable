# Stable Diffusion WebUI Offline (Portable)
This Project Aims for 100% Offline Stable Diffusion (People without internet or with slow internet can get it via USB or HD-DVD)

# Preparation Guide
- Download repo zip file extract
- Run install.bat
- Download all models and put into stable-diffusion-webui\models\Stable-diffusion folder
- Test with run.bat
- Delete install.bat and pkgs folder
- Zip 
- Share 🎉

# Optional
- Edit interrogate.py (If you want to use Interrogate CLIP feature)
  - Open stable-diffusion-webui\modules\interrogate.py 
  - Add `from modules.paths import script_path` line after `from modules import devices, paths, lowvram` line
  - Find `model, preprocess = clip.load(clip_model_name)` 
  - Change to `model, preprocess = clip.load(name=clip_model_name, download_root=os.path.join(script_path, 'cache/clip'))`

micromamba.exe from https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html

Example Project: https://camenduru.itch.io/stable-diffusion-webui

## Example Project Preparation (Youtube Video)
[![How to Use Stable Diffusion Webui Colab](https://i.imgur.com/Zi3LsXj.jpg)](https://www.youtube.com/watch?v=PHZ0VC_Losk)

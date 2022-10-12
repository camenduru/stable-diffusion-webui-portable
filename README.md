# Stable Diffusion WebUI Offline
This Project Aims for 100% Offline Stable Diffusion (People without internet or with slow internet can get it via USB or CD)

# Preparation Guide
- Clone this repo
- Clone https://github.com/AUTOMATIC1111/stable-diffusion-webui inside this repo folder
- Copy and paste files from C:\Users\<YOUR USE NAME>\\.cache folder to stable-diffusion-webui\cache
- Clone dependencies to stable-diffusion-webui\repositories
- Download all models and put into stable-diffusion-webui\models
- Delete pkgs folder
- Edit interrogate.py
  - Open stable-diffusion-webui\modules\interrogate.py 
  - Add `from modules.paths import script_path` line after `from modules import devices, paths, lowvram` line
  - Find `model, preprocess = clip.load(clip_model_name)` 
  - Change to `model, preprocess = clip.load(name=clip_model_name, download_root=os.path.join(script_path, 'cache/clip'))`
- Test

micromamba.exe from https://mamba.readthedocs.io/en/latest/user_guide/micromamba.html

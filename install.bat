@CALL echo off
@CALL "%~dp0micromamba.exe" create -n sd-vnev python=3.10.9 git=2.41.0 git-lfs=3.2.0 -c conda-forge -r "%~dp0\" -y
@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
@CALL condabin\micromamba.bat activate sd-vnev
@CALL set GDOWN_CACHE=cache\gdown
@CALL set TORCH_HOME=cache\torch
@CALL set HF_HOME=cache\huggingface
@CALL set PYTHONDONTWRITEBYTECODE=1
@CALL pip install torch==2.0.1 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
@CALL pip install xformers gradio gfpgan
@CALL git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
@CALL cd stable-diffusion-webui
@CALL python -B launch.py --opt-sdp-attention --autolaunch --theme dark --listen --enable-insecure-extension-access

@CALL PAUSE

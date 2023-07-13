@CALL echo off
@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
@CALL condabin\micromamba.bat activate sd-vnev
@CALL set GDOWN_CACHE=cache\gdown
@CALL set TORCH_HOME=cache\torch
@CALL set HF_HOME=cache\huggingface
@CALL set PYTHONDONTWRITEBYTECODE=1
@CALL set ATTN_PRECISION=fp16
@CALL cd stable-diffusion-webui
@CALL python -B webui.py --opt-sdp-attention --xformers --autolaunch --theme dark --listen --enable-insecure-extension-access
@CALL PAUSE
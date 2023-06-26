@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
@CALL condabin\micromamba.bat activate sd-venv
@REM ROOT LOCATIONS: 
@CALL set GDOWN_CACHE=cache\gdown
@CALL set TORCH_HOME=cache\torch
@CALL set HF_HOME=cache\huggingface
@CALL set PYTHONDONTWRITEBYTECODE=1
@CALL cd stable-diffusion-webui
@CALL python -B webui.py --opt-sdp-attention --xformers --autolaunch --theme dark --listen
@CALL PAUSE
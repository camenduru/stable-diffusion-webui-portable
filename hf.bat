@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
@CALL condabin\micromamba.bat activate sd
@CALL set GDOWN_CACHE=stable-diffusion-webui\cache\gdown
@CALL set TORCH_HOME=stable-diffusion-webui\cache\torch
@CALL set HF_HOME=stable-diffusion-webui\cache\huggingface
@CALL set PYTHONDONTWRITEBYTECODE=1
@CALL python -B -m pip -qq install diffusers transformers -U
@CALL python -B hf.py
@CALL PAUSE
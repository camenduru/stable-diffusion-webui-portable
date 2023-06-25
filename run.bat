@CALL echo off
@REM Base VARIABLES:
@CALL set VENV_NAME=sd-vnev
@REM PYTHON & GIT VERSIONS:
@CALL set PYTHON_VERSION=3.10.11
@CALL set GIT_VERSION=2.41.0
@CALL set GITLFS_VERSION=3.2.0
@CALL set TORCH_VERSION=2.0.1
@CALL set TORCHVISION_VERSION=2.0.2
@CALL set TORCHAUDIO_VERSION=0.15.2
@CALL set XFORMERS_VERSION=0.0.20

@REM SETTING UP ENVIRONMENT...
@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
@CALL condabin\micromamba.bat activate %VENV_NAME%
@REM ROOT LOCATIONS: 
@CALL set ROOT=%~dp0
@CALL set WEBUI_LOACTION=%~dp0stable-diffusion-webui
@REM DEPOT SETTING ...
@CALL set SDDEPOT=https://github.com/AUTOMATIC1111/stable-diffusion-webui/
@CALL set BRANCH=master
@REM LAUNCH VARIABLES:
@CALL set GDOWN_CACHE=cache\gdown
@CALL set TORCH_HOME=cache\torch
@CALL set HF_HOME=cache\huggingface
@CALL set PYTHONDONTWRITEBYTECODE=1
@CALL set COMMANDLINE_ARGS=--opt-sdp-attention --autolaunch --theme dark --listen

@REM VARIABLES ...
@CALL echo         ---------------------------------------------------
@CALL echo         ROOT LOCATIONS:
@CALL echo         CURRENT ROOT:            %ROOT%
@CALL echo         WebUI Location:          %WEBUI_LOACTION%
@CALL echo         ---------------------------------------------------
@CALL echo         DEPOT SETTING :
@CALL echo         Remote Address:          %SDDEPOT%
@CALL echo         Current Branch:          %BRANCH%
@CALL echo         ---------------------------------------------------
@CALL echo         TOOLS VERSIONS:
@CALL echo         PYTHON VERSION:          %PYTHON_VERSION%
@CALL echo         GIT-VERSION:             %GIT_VERSION%
@CALL echo         GIT-LFS VERSION:         %GITLFS_VERSION%
@CALL echo         TORCH_VERSION:           %TORCH_VERSION%+cu118
@CALL echo         TORCHVISION_VERSION:     %TORCHVISION_VERSION%+cu118
@CALL echo         TORCHAUDIO_VERSION:      %TORCHAUDIO_VERSION%+cu118
@CALL echo         XFORMERS_VERSION:        %XFORMERS_VERSION%
@CALL echo         ---------------------------------------------------
@CALL echo         LAUNCH VARIABLES:
@CALL echo         VENV_NAME:               %VENV_NAME%
@CALL echo         GDOWN_CACHE:             %GDOWN_CACHE%
@CALL echo         TORCH_HOME:              %TORCH_HOME%
@CALL echo         HF_HOME:                 %HF_HOME%
@CALL echo         PYTHONDONTWRITEBYTECODE: %PYTHONDONTWRITEBYTECODE%
@CALL echo         COMMANDLINE_ARGS:        %COMMANDLINE_ARGS%
@CALL echo         ---------------------------------------------------

@REM LAUNCH WEBUI ...
@CALL echo LAUNCH WEBUI ...
@CALL cd %WEBUI_LOACTION%
@CALL echo Launch WebUI with COMMANDLINE_ARGS: %COMMANDLINE_ARGS%
@CALL python -B launch.py %COMMANDLINE_ARGS%

@CALL PAUSE
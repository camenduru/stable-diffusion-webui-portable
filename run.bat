@CALL echo off
@REM SETTING VARIABLES...
@REM ROOT LOCATIONS: 
@CALL set ROOT=%~dp0
@CALL set WEBUI_LOACTION=%ROOT%stable-diffusion-webui
@REM DEPOT SETTING ...
@CALL set SDDEPOT=https://github.com/Jeffreytsai1004/stable-diffusion-webui/
@CALL set BRANCH=cu118
@REM PYTHON & GIT VERSIONS:
@CALL set PYTHON_VERSION=3.10.11
@CALL set GIT_VERSION=2.41.0
@CALL set GITLFS_VERSION=3.2.0
@CALL set TORCH_VERSION=2.0.1+cu118
@CALL set TORCHVISION_VERSION=0.15.2+cu118
@CALL set XFROMERS_VERSION=0.0.16rc425
@REM LAUNCH VARIABLES:
@CALL set VENV_NAME=sd-vnev
@CALL set VENV_DIR=%ROOT%envs/%VENV_NAME%
@CALL set GDOWN_CACHE=cache\gdown
@CALL set TORCH_HOME=cache\torch
@CALL set HF_HOME=cache\huggingface
@CALL set PYTHONDONTWRITEBYTECODE=1
@CALL set COMMANDLINE_ARGS=--xformers

@REM SETTING UP ENVIRONMENT...
@CALL "%~dp0micromamba.exe" create -n %VENV_NAME% python=%PYTHON_VERSION% git=%GIT_VERSION% git-lfs=%GITLFS_VERSION% -c conda-forge -r "%~dp0\" -y
@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
@CALL condabin\micromamba.bat activate %VENV_NAME%

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
@CALL echo         PYTHON & GIT VERSIONS:
@CALL echo         PYTHON VERSION:          %PYTHON_VERSION%
@CALL echo         GIT VERSION:             %GIT_VERSION%
@CALL echo         GIT-LFS VERSION:         %GITLFS_VERSION%
@CALL echo         XFROMERS_VERSION:        %XFROMERS_VERSION%
@CALL echo         TORCH_VERSION:           %TORCH_VERSION%
@CALL echo         TORCHVISION_VERSION:     %TORCHVISION_VERSION%
@CALL echo         ---------------------------------------------------
@CALL echo         LAUNCH VARIABLES:
@CALL echo         VENV_NAME:               %VENV_NAME%
@CALL echo         VENV_DIR:                %VENV_DIR%
@CALL echo         GDOWN_CACHE:             %GDOWN_CACHE%
@CALL echo         TORCH_HOME:              %TORCH_HOME%
@CALL echo         HF_HOME:                 %HF_HOME%
@CALL echo         PYTHONDONTWRITEBYTECODE: %PYTHONDONTWRITEBYTECODE%
@CALL echo         COMMANDLINE_ARGS:        %COMMANDLINE_ARGS%
@CALL echo         ---------------------------------------------------

@REM LAUNCH WEBUI ...
@CALL echo LAUNCH WEBUI ...
@CALL cd "%WEBUI_LOACTION%"
@CALL echo Launch WebUI with COMMANDLINE_ARGS: "%COMMANDLINE_ARGS%"
@CALL python -B launch.py "%COMMANDLINE_ARGS%"

@CALL PAUSE

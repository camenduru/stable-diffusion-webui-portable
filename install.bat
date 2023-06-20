@CALL echo off
@REM SETTING VARIABLES...
@REM ROOT LOCATIONS: 
@CALL set ROOT=%~dp0
@CALL set WEBUI_LOACTION=%ROOT%stable-diffusion-webui
@REM DEPOT SETTING ...
@CALL set SDDEPOT=https://github.com/Jeffreytsai1004/stable-diffusion-webui/
@CALL set BRANCH=cu117
@REM PYTHON & GIT VERSIONS:
@CALL set PYTHON_VERSION=3.10.11
@CALL set GIT_VERSION=2.41.0
@CALL set GITLFS_VERSION=3.2.0
@CALL set TORCH_VERSION=1.13.1
@CALL set XFROMERS_VERSION=0.0.16
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
@CALL python -m pip install --upgrade pip
@CALL pip install xformers==%XFROMERS_VERSION%
@CALL pips install torch==%TORCH_VERSION% torchvision torchaudio --index-url https://download.pytorch.org/whl/cu117
@REM CLONE STABLE-DIFFUSION-WEBUI...
@CALL git clone -b %BRANCH% %SDDEPOT% %WEBUI_LOACTION%

@REM CLONE REPOSITORIES...
@CALL git clone https://github.com/CompVis/stable-diffusion.git %WEBUI_LOACTION%\respositories\stable-diffusion
@CALL git clone https://github.com/CompVis/taming-transformers.git %WEBUI_LOACTION%\respositories\taming-transformers
@CALL git clone https://github.com/crowsonkd/k-diffusion.git %WEBUI_LOACTION%\respositories\k-diffusion
@CALL git clone https://github.com/sczhou/CodeFormer.git %WEBUI_LOACTION%\respositories\CodeFormer
@CALL git clone https://github.com/saleforce/BLIP.git %WEBUI_LOACTION%\respositories\BLIP

@REM CLONE BASE PLUGINS...
@CALL git clone -b main https://github.com/Jeffreytsai1004/a1111-sd-webui-tagcomplete %WEBUI_LOACTION%\extensions\a1111-sd-webui-tagcomplete
@CALL git clone -b main https://github.com/Jeffreytsai1004/multidiffusion-upscaler-for-automatic1111 %WEBUI_LOACTION%\extensions\multidiffusion-upscaler-for-automatic1111
@CALL git clone -b main https://github.com/Jeffreytsai1004/sd-webui-additional-networks %WEBUI_LOACTION%\extensions\sd-webui-additional-networks
@CALL git clone -b main https://github.com/Jeffreytsai1004/sd-webui-controlnet %WEBUI_LOACTION%\extensions\sd-webui-controlnet
@CALL git clone -b main https://github.com/Jeffreytsai1004/sd-webui-infinite-image-browsing %WEBUI_LOACTION%\extensions\sd-webui-infinite-image-browsing
@CALL git clone -b main https://github.com/Jeffreytsai1004/sd-webui-model-converter %WEBUI_LOACTION%\extensions\sd-webui-model-converter
@CALL git clone -b main https://github.com/Jeffreytsai1004/stable-diffusion-webui-localization-zh_CN %WEBUI_LOACTION%\extensions\stable-diffusion-webui-localization-zh_CN
@CALL git clone -b master https://github.com/Jeffreytsai1004/stable-diffusion-webui-localization-zh_Hans %WEBUI_LOACTION%\extensions\stable-diffusion-webui-localization-zh_Hans
@CALL git clone -b master https://github.com/Jeffreytsai1004/stable-diffusion-webui-wd14-tagger %WEBUI_LOACTION%\extensions\stable-diffusion-webui-wd14-tagger

@REM DOWNLOADING BASE MODELS...
@CALL curl "https://civitai-delivery-worker-prod-2023-06-01.5ac0637cfd0766c97916cefa3764fbdf.r2.cloudflarestorage.com/262917/model/anythingv5PrtRE.7wG5.safetensors?X-Amz-Expires=86400&response-content-disposition=attachment%3B%20filename%3D%22AnythingV5Ink_v5PrtRE.safetensors%22&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=2fea663d76bd24a496545da373d610fc/20230615/us-east-1/s3/aws4_request&X-Amz-Date=20230615T190257Z&X-Amz-SignedHeaders=host&X-Amz-Signature=2e2217c4246aab5fa025fb4b75acccba3a98ed559d09ad53c5a335eb3a84730b" --output "%WEBUI_LOACTION%\models\Stable-diffusion\AnythingV5Ink_v5PrtRE.safetensors"
@CALL curl "https://civitai-delivery-worker-prod-2023-06-01.5ac0637cfd0766c97916cefa3764fbdf.r2.cloudflarestorage.com/3068/model/easynegative.YTMh.safetensors?X-Amz-Expires=86400&response-content-disposition=attachment%3B%20filename%3D%22easynegative.safetensors%22&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=2fea663d76bd24a496545da373d610fc/20230615/us-east-1/s3/aws4_request&X-Amz-Date=20230615T190540Z&X-Amz-SignedHeaders=host&X-Amz-Signature=9d868a74516bbbf7e39ce95ddf4b2e3b1df3ed851f1772b027b49fea75e58115" --output "%WEBUI_LOACTION%\embeddings\EasyNegative.safetensors"
@CALL curl "https://cdn-lfs.huggingface.co/repos/ec/ee/eceee26c5834d8a75cf04eeb17dfc06d1d5fe1d80c2f19520b148c11e2e98c45/735e4c3a447a3255760d7f86845f09f937809baa529c17370d83e4c3758f3c75?response-content-disposition=attachment%3B+filename*%3DUTF-8%27%27vae-ft-mse-840000-ema-pruned.safetensors%3B+filename%3D%22vae-ft-mse-840000-ema-pruned.safetensors%22%3B&Expires=1687115312&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZG4tbGZzLmh1Z2dpbmdmYWNlLmNvL3JlcG9zL2VjL2VlL2VjZWVlMjZjNTgzNGQ4YTc1Y2YwNGVlYjE3ZGZjMDZkMWQ1ZmUxZDgwYzJmMTk1MjBiMTQ4YzExZTJlOThjNDUvNzM1ZTRjM2E0NDdhMzI1NTc2MGQ3Zjg2ODQ1ZjA5ZjkzNzgwOWJhYTUyOWMxNzM3MGQ4M2U0YzM3NThmM2M3NT9yZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPSoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODcxMTUzMTJ9fX1dfQ__&Signature=AFpMhLzObXCyZI2gcLg3Q3e7CCusyBk2KBAoo1WtAdWHkyQEEXsZrFO3RD%7EbIld3e4YKzzgLPwjqUox9hPYOKMxptki9xX-GcqdYyzJMg1A5S3iaJiXJwbPijauOoKsRrg2ojmib43Qx0Zs30THy4sj5GuSQ53SY9X9%7EtGHaONqioxAOAJLQAL3rlOti3QY-FuEQ7S2L02F5gTcGOTg1RqmpSfI9WxxPLnBJ4duovq70W9vZo8DF4VWREYypC3NzmVg6E0zRbtzleiaSjWporEIVIyTfpGLClJFQEJonGU%7EauyhlGdBHZDf6Q9oesBcyDCu2h0jx7jkyI053dd%7EBdw__&Key-Pair-Id=KVTP0A1DKRTAX" --output "%WEBUI_LOACTION%\models\VAE\vae-ft-mse-840000-ema-pruned.safetensors"
@CALL curl "https://cdn-lfs.huggingface.co/repos/bf/67/bf675108928dfc4635fd5b819bedfc5a96c30517a5dc961761489108d2c5c19a/f921fb3f29891d2a77a6571e56b8b5052420d2884129517a333c60b1b4816cdf?response-content-disposition=attachment%3B+filename*%3DUTF-8%27%27animevae.pt%3B+filename%3D%22animevae.pt%22%3B&Expires=1687115659&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZG4tbGZzLmh1Z2dpbmdmYWNlLmNvL3JlcG9zL2JmLzY3L2JmNjc1MTA4OTI4ZGZjNDYzNWZkNWI4MTliZWRmYzVhOTZjMzA1MTdhNWRjOTYxNzYxNDg5MTA4ZDJjNWMxOWEvZjkyMWZiM2YyOTg5MWQyYTc3YTY1NzFlNTZiOGI1MDUyNDIwZDI4ODQxMjk1MTdhMzMzYzYwYjFiNDgxNmNkZj9yZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPSoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODcxMTU2NTl9fX1dfQ__&Signature=SAKIfTe6qJCJwSRUJMo-qVA4wyjmpuf0GMKLK4OoTDWTptF9b54wqplXNFh-zwjfbIZGvcvswLb99-A9sr9ULn91THbR0fRzcLuBskFhORCrFDttpoJbh6YUeRg8tMg3yd0kwKWl-Z2HSTUbevU-jJx-8CWfNlJq26mJR2yNNTfnOrQlqYOZm1L64j2TOmwUxvaY3VUxdHdTxC9U2Ll4JSlrTHcPeZb8dNa-OlZw12hTg7Au5I7oMq5TcH8Q2hky7JEVr0HVDjnkM44DOG1UPebNuP66Rq7Kps6GxWnKJxsS5ONfmVvPbUgryFG-8KTWSfWuz0sHliDsLXcS%7EUVI9A__&Key-Pair-Id=KVTP0A1DKRTAX" --output "%WEBUI_LOACTION%\models\VAE\animevae.pt"

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

@CALL "%~dp0micromamba.exe" create -n sd python=3.10 git git-lfs -c conda-forge -r "%~dp0\" -y
@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
@CALL condabin\micromamba.bat activate sd
@CALL git clone -b v2.2 https://github.com/camenduru/stable-diffusion-webui
@CALL cd stable-diffusion-webui
@CALL python launch.py
@CALL PAUSE

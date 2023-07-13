@CALL echo off
@CALL "%~dp0micromamba.exe" create -n sd-vnev python=3.10.11 git=2.41.0 git-lfs=3.2.0 -c conda-forge -r "%~dp0\" -y
@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
@CALL condabin\micromamba.bat activate sd-vnev
@CALL pip install torch==2.0.1 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
@CALL pip install xformers==0.0.20 gradio gfpgan protobuf==3.20.0 soundfile
@CALL PAUSE

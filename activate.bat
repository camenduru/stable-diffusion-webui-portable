@CALL set VENV_NAME=sd-vnev
@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
start cmd /k "%~dp0condabin\micromamba.bat" activate %VENV_NAME%
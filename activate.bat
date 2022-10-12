@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
start cmd /k "%~dp0condabin\micromamba.bat" activate sd
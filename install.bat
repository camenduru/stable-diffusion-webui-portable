@CALL "%~dp0micromamba.exe" create -n sd python=3.10 -c conda-forge -r "%~dp0\"
@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
@CALL condabin\micromamba.bat activate sd
@CALL pip install -r requirements.txt
@CALL PAUSE
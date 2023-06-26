@CALL echo off
@CALL set TORCH_VERSION=2.0.1
@CALL set TORCHVISION_VERSION=2.0.2
@CALL set TORCHAUDIO_VERSION=0.15.2
@CALL set XFORMERS_VERSION=0.0.20

@CALL "%~dp0micromamba.exe" create -n sd-vnev python=3.10.11 git=2.41.0 git-lfs=3.2.0 -c conda-forge -r "%~dp0\" -y
@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
@CALL condabin\micromamba.bat activate sd-vnev

@REM LAUNCH VARIABLES:
@CALL set GDOWN_CACHE=cache\gdown
@CALL set TORCH_HOME=cache\torch
@CALL set HF_HOME=cache\huggingface
@CALL set PYTHONDONTWRITEBYTECODE=1
@CALL set COMMANDLINE_ARGS=--opt-sdp-attention --xformers --autolaunch --theme dark --listen

@REM PIP INSTALLING DEPENDENCIES...
@CALL pip install torch==%TORCH_VERSION% torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 --no-cache-dir
@CALL pip install xformers
@CALL pip install gradio==3.32.0

@REM CLONE STABLE-DIFFUSION-WEBUI...
@CALL git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui

@REM @REM CLONE REPOSITORIES...
@REM @CALL git clone https://github.com/Jeffreytsai1004/CompVis-stable-diffusion.git stable-diffusion-webui\repositories\stable-diffusion
@REM @CALL git clone https://github.com/Jeffreytsai1004/taming-transformers.git stable-diffusion-webui\repositories\taming-transformers
@REM @CALL git clone https://github.com/Jeffreytsai1004/k-diffusion.git stable-diffusion-webui\repositories\k-diffusion
@REM @CALL git clone https://github.com/Jeffreytsai1004/CodeFormer.git stable-diffusion-webui\repositories\CodeFormer
@REM @CALL git clone https://github.com/Jeffreytsai1004/BLIP.git stable-diffusion-webui\repositories\BLIP

@REM @REM DOWNLOADING BASE MODELS...
@REM @CALL curl -L https://huggingface.co/embed/EasyNegative/resolve/main/EasyNegative.safetensors -o stable-diffusion-webui\embeddings\EasyNegative.safetensors
@REM @CALL curl -L https://huggingface.co/Toooajk/YaguruMagiku/resolve/main/YaguruMagiku-v4/embeddings/yaguru%20magiku.pt -o stable-diffusion-webui\embeddings\yaguru%20magiku.pt
@REM @CALL curl -L https://cdn-lfs.huggingface.co/repos/0a/1d/0a1d9c5fc6ff78cf663d7cdf6173886450a85f32de6528b8168c9259f7336972/c74b4e810b030f6b75fde959e2db678c268d07115b85356d3c0138ba5eb42340?response-content-disposition=attachment%3B+filename*%3DUTF-8%27%27EasyNegative.safetensors%3B+filename%3D%22EasyNegative.safetensors%22%3B&Expires=1687852965&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZG4tbGZzLmh1Z2dpbmdmYWNlLmNvL3JlcG9zLzBhLzFkLzBhMWQ5YzVmYzZmZjc4Y2Y2NjNkN2NkZjYxNzM4ODY0NTBhODVmMzJkZTY1MjhiODE2OGM5MjU5ZjczMzY5NzIvYzc0YjRlODEwYjAzMGY2Yjc1ZmRlOTU5ZTJkYjY3OGMyNjhkMDcxMTViODUzNTZkM2MwMTM4YmE1ZWI0MjM0MD9yZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPSoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODc4NTI5NjV9fX1dfQ__&Signature=VMA4AgT3nenBruigAioY7%7E2dErOUPNCkSMTxfZ1eCHaI6rQ50hPk2H5soUolfbq4tDhW%7EobIKrWgfxLDVn8%7EB4jxJ4edExPJgsZLxV9tV8M4feDDCKhd2itNiZI-K3FufAijuaRv8UqK415enwr7lW4%7EeHLE%7E%7ExAUObtBmKqp5x8FibNvCvEci3YGNxEm2mLy3AlEiWeYzB%7EWZt6AOPwfZnbtEk%7E%7E7trrwZNw1cK1Lul1jKzOlEIzw8FSPa3nksrB0WUGx%7EUCoP39VmyOPn%7EagdWjmsIob%7EbVvtJ95SfdMJvBFMlmHOlgzF%7EwM%7EDt8w2y8zTtDPwxIl8lpp2R69ZMw__&Key-Pair-Id=KVTP0A1DKRTAX -o stable-diffusion-webui\embeddings\EasyNegative.safetensors
@REM @CALL curl -L https://cdn-lfs.huggingface.co/repos/6b/20/6b201da5f0f5c60524535ebb7deac2eef68605655d3bbacfee9cce0087f3b3f5/1a189f0be69d6106a48548e7626207dddd7042a418dbf372cefd05e0cdba61b6?response-content-disposition=attachment%3B+filename*%3DUTF-8%27%27v1-5-pruned.safetensors%3B+filename%3D%22v1-5-pruned.safetensors%22%3B&Expires=1687870635&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZG4tbGZzLmh1Z2dpbmdmYWNlLmNvL3JlcG9zLzZiLzIwLzZiMjAxZGE1ZjBmNWM2MDUyNDUzNWViYjdkZWFjMmVlZjY4NjA1NjU1ZDNiYmFjZmVlOWNjZTAwODdmM2IzZjUvMWExODlmMGJlNjlkNjEwNmE0ODU0OGU3NjI2MjA3ZGRkZDcwNDJhNDE4ZGJmMzcyY2VmZDA1ZTBjZGJhNjFiNj9yZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPSoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODc4NzA2MzV9fX1dfQ__&Signature=QWWI7oBLRdj86mJ3IvzNPmE7cZFEXy8nF6mhqIMJSUy%7ElFRJVUcEZ6ZoRIDi2ty0Mrw0G9lejfTpDSk1GJLgmmRoix3PqfoEZSjWT940NbhiMtz8ehCy3f0i7rxplrOT3gybpbmFCP8fIsaO-oiMWssAAe9csQoUTlTSkmusWK-9vTbFhltklZHiRlpOxxnIkaDpO4XzdZEIOZZL9XH3EP%7EMp8G8UcIglTfzV7jT0uFjxAN%7Ee12c-1e4uBlRS%7E-stzuhr3Vc4IR4eewt%7EDM1WlkXnU2VIOyqhwqphxauTV8CEv8-hiqWJAOHID7Nqxa9c1MuY0Q-VBqkofsAZ4TZgQ__&Key-Pair-Id=KVTP0A1DKRTAX -o stable-diffusion-webui\models\Stable-diffusion\v1-5-pruned.safetensors
@REM @CALL curl -L https://cdn-lfs.huggingface.co/repos/6b/20/6b201da5f0f5c60524535ebb7deac2eef68605655d3bbacfee9cce0087f3b3f5/6ce0161689b3853acaa03779ec93eafe75a02f4ced659bee03f50797806fa2fa?response-content-disposition=attachment%3B+filename*%3DUTF-8%27%27v1-5-pruned-emaonly.safetensors%3B+filename%3D%22v1-5-pruned-emaonly.safetensors%22%3B&Expires=1687863093&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZG4tbGZzLmh1Z2dpbmdmYWNlLmNvL3JlcG9zLzZiLzIwLzZiMjAxZGE1ZjBmNWM2MDUyNDUzNWViYjdkZWFjMmVlZjY4NjA1NjU1ZDNiYmFjZmVlOWNjZTAwODdmM2IzZjUvNmNlMDE2MTY4OWIzODUzYWNhYTAzNzc5ZWM5M2VhZmU3NWEwMmY0Y2VkNjU5YmVlMDNmNTA3OTc4MDZmYTJmYT9yZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPSoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODc4NjMwOTN9fX1dfQ__&Signature=FozZ-qsusHzTBXIjxQMF61rfyo-fq0re0xlGV0n-28-9WOFNhRsj5mT5lt2OFRjS1Qjm-UPrguuQBJD6Z4qfxrGrPzXosc3VlgeI6ZcYWgq94pz6gFtDA6yPvfDw4yHU9oNpEMYxzozJ9YXARbPgXMmNUMcDKVOcZk9wzRlIfUacbgBEc42lTV8Nzl6I26ysiUHLXHrDYAzYyuafBkCwb4UG2P1ZrdOtbCWahb1AvrssRPn2hQuMk-aMkMADeHip0X5WqpCN6MRi4IJ69iWAlo%7E-j-oR55AqQnKpKJqmVhEAd3yRb4cBVb223cTLY-ir2zTjd9CghJfrIQcTBW9N4w__&Key-Pair-Id=KVTP0A1DKRTAX -o stable-diffusion-webui\models\v1-5-pruned-emaonly.safetensors
@REM @CALL curl -L https://cdn-lfs.huggingface.co/repos/b4/71/b47143176d3790e957485b59cc13cf072a4b2cbe3340d1b8fa86f53d7197236f/dcd690123cfc64383981a31d955694f6acf2072a80537fdb612c8e58ec87a8ac?response-content-disposition=attachment%3B+filename*%3DUTF-8%27%27v2-1_768-ema-pruned.safetensors%3B+filename%3D%22v2-1_768-ema-pruned.safetensors%22%3B&Expires=1687870684&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZG4tbGZzLmh1Z2dpbmdmYWNlLmNvL3JlcG9zL2I0LzcxL2I0NzE0MzE3NmQzNzkwZTk1NzQ4NWI1OWNjMTNjZjA3MmE0YjJjYmUzMzQwZDFiOGZhODZmNTNkNzE5NzIzNmYvZGNkNjkwMTIzY2ZjNjQzODM5ODFhMzFkOTU1Njk0ZjZhY2YyMDcyYTgwNTM3ZmRiNjEyYzhlNThlYzg3YThhYz9yZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPSoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODc4NzA2ODR9fX1dfQ__&Signature=fj1VZjVPGFsuL%7EgKmKBipjg4Us6irpQBtiNsw5LdSIgpAPxaE5VeV5rrPjalN0ONqtN0Kvnm0%7Ew7CxoDUNXEgKQGGjU3pD9HqHeydGrP97u2uNSjPg51jlmLrHWJaQeuARei4dtQEB6ZqTGZAZyO8a9WHkjNX%7E5wS4U67yhOSR2DRBc9R1t6wnMcliA1D%7EMDLyhr2bpTP6HX97M1dfWFajDw1FtMQ4VTf5aZdXIlBYtVz0Vjg%7Ea6XucoHpmjyrbCOV0xrk%7EB3Nk1EiUhZ7Y1lqPf6%7EMDuG79xDBEotewp-vvyieN7NPAqJneniphadHMWBrRbJOAYr5SPNynVmUyHQ__&Key-Pair-Id=KVTP0A1DKRTAX -o stable-diffusion-webui\models\v2-1_768-ema-pruned.safetensors
@REM @CALL curl -L https://cdn-lfs.huggingface.co/repos/b4/71/b47143176d3790e957485b59cc13cf072a4b2cbe3340d1b8fa86f53d7197236f/ff144a49841cf383adbc68841272ce639e1032b0a1f0f6586347feb953c244f4?response-content-disposition=attachment%3B+filename*%3DUTF-8%27%27v2-1_768-nonema-pruned.safetensors%3B+filename%3D%22v2-1_768-nonema-pruned.safetensors%22%3B&Expires=1687867572&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZG4tbGZzLmh1Z2dpbmdmYWNlLmNvL3JlcG9zL2I0LzcxL2I0NzE0MzE3NmQzNzkwZTk1NzQ4NWI1OWNjMTNjZjA3MmE0YjJjYmUzMzQwZDFiOGZhODZmNTNkNzE5NzIzNmYvZmYxNDRhNDk4NDFjZjM4M2FkYmM2ODg0MTI3MmNlNjM5ZTEwMzJiMGExZjBmNjU4NjM0N2ZlYjk1M2MyNDRmND9yZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPSoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODc4Njc1NzJ9fX1dfQ__&Signature=wnq0QIbLBPqwVGfmfNOGYcvTEFrIIX1bX0BwsropH-ytUEpqv1h-A%7ErAY7KuVFCeJcSYJ7YAemRwewYqa4mZ1oE0w5Q0%7ETDEG55hyJegHOKBgBjzxICpsVzONvx-sdyixLlFWKAHvTq6ydKGc5UvB96rFqwDi7h7Ddwf2Zl-DDpn%7EtJJBeKqsMcOu2nGx7oD5sy3khgHZ6VnfoHv2KMeY3Y7z%7Ee1dUAjLmDNWwjY6axvJs6RmuWuf%7E7rD16b98nBirCihOzixXVE9ojGfHq47mqo3jWApgnYrDJvvJQoQdkTSvUmn%7E5Hd%7E3Q8em4WmjujCZbqCn%7EjJ4FFvUvzIDLcw__&Key-Pair-Id=KVTP0A1DKRTAX -o stable-diffusion-webui\models\v2-1_768-nonema-pruned.safetensors

@CALL cd stable-diffusion-webui
@CALL python -B launch.py --opt-sdp-attention --xformers --autolaunch --theme dark --listen
@CALL PAUSE

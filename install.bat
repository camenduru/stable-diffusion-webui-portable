@CALL "%~dp0micromamba.exe" create -n sd python=3.10 git git-lfs -c conda-forge -r "%~dp0\" -y
@CALL "%~dp0micromamba.exe" shell init --shell=cmd.exe --prefix="%~dp0\"
@CALL condabin\micromamba.bat activate sd
@CALL pip install -r requirements.txt
@CALL git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
@CALL cd stable-diffusion-webui
@CALL git clone https://github.com/CompVis/stable-diffusion.git repositories/stable-diffusion
@CALL git clone https://github.com/CompVis/taming-transformers.git repositories/taming-transformers
@CALL git clone https://github.com/crowsonkb/k-diffusion.git repositories/k-diffusion
@CALL git clone https://github.com/sczhou/CodeFormer.git repositories/CodeFormer
@CALL git clone https://github.com/salesforce/BLIP.git repositories/BLIP
@CALL python -m wget https://huggingface.co/nitrosocke/mo-di-diffusion/resolve/main/moDi-v1-pruned.ckpt -o models/Stable-diffusion/moDi-v1-pruned.ckpt
@CALL PAUSE
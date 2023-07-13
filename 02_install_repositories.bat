@echo off
@CALL git clone -b v1.4.1 https://github.com/AUTOMATIC1111/stable-diffusion-webui
@CALL git clone https://github.com/Stability-AI/stablediffusion.git ./stable-diffusion-webui/repositories/stable-diffusion-stability-ai
@CALL git clone https://github.com/CompVis/taming-transformers.git ./stable-diffusion-webui/repositories/taming-transformers
@CALL git clone https://github.com/crowsonkb/k-diffusion.git ./stable-diffusion-webui/repositories/k-diffusion
@CALL git clone https://github.com/sczhou/CodeFormer.git ./stable-diffusion-webui/repositories/CodeFormer
@CALL git clone https://github.com/salesforce/BLIP.git ./stable-diffusion-webui/repositories/BLIP
@pause
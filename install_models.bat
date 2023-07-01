@echo off
@CALL curl -L https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors -o %~dp0\stable-diffusion-webui\models\Stable-diffusion\v1-5-pruned-emaonly.safetensors
@CALL curl -L https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.safetensors -o %~dp0\stable-diffusion-webui\models\Stable-diffusion\v2-1_768-ema-pruned.safetensors
@pause
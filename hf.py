import torch
from diffusers import StableDiffusionPipeline
generator = torch.cuda.manual_seed("4609990744076363")
pipe = StableDiffusionPipeline.from_pretrained("nitrosocke/mo-di-diffusion", safety_checker=None).to("cuda")
image = pipe("donald duck", height=512, width=512, num_inference_steps=50, guidance_scale=7.5).images[0]
print(torch.cuda.initial_seed())
image.save(f"duck.png")

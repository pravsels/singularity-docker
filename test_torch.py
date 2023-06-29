import torch

import torch

if torch.cuda.is_available():
    print("CUDA is available")
    device = torch.device('cuda')
    x = torch.randn(4, 4).to(device)
    print("Tensor on GPU:", x)
else:
    print("CUDA is not available")


if torch.cuda.is_available():
    print("CUDA is available")
    device = torch.device('cuda')
    x = torch.randn(4, 4).to(device)
    print("Tensor on GPU:", x)
else:
    print("CUDA is not available")

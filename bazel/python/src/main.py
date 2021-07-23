import time

# while True:
#     print("Hello, World!")
#     time.sleep(10)

import torch

print('Torch Version: %s' % torch.__version__)

x = torch.rand(5, 3)
print(x)

torch.cuda.is_available()

# I. Cài đặt matplotlib cho Linux
```
pip install matplotlib
```
# II. Tiến hành code
## Convert RGB Image to Grayscale
## 1. Python
Ta có công thức
```
RGB[A] to Gray:Y←0.299⋅R+0.587⋅G+0.114⋅B
```
```python
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from PIL import *

img = Image.open('Sasha.PNG').convert('LA')
img.save('greyscale.png')

def rgb2gray(rgb):
    return np.dot(rgb[...,:3], [0.299, 0.587, 0.114])

img = mpimg.imread('Sasha.PNG')     
gray = rgb2gray(img)    
plt.imshow(gray, cmap=plt.get_cmap('gray'), vmin=0, vmax=1)
plt.show()

```
## 2. Verilog
### RTL:
![Image description](https://github.com/alle99101/Ratatouille/blob/main/Assignment/Week2/RTL/Schematic/TopRTL.PNG)
Sử dụng 32 bit floating point input.

![Image description](https://github.com/alle99101/Ratatouille/blob/main/Assignment/Week2/RTL/Schematic/ALURTL.PNG)
Thực hiện phép tính và lưu kết quả ra grayfloat.txt.
## 3. Compare
Thực hiện open image của verilog bằng file grayfloat.txt bằng python và so sánh kết quả.


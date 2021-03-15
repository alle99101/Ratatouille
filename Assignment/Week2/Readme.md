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
### Convert image file to bin
```python
import cv2
import numpy as np 

img = cv2.imread('Sasha.PNG')
b,g,r = cv2.split(img)
with open("Red.txt","w") as Red:
  for _ in r:
    np.savetxt(Red,_,fmt='%d')
with open("Blue.txt","w") as Blue:
  for _ in b:
    np.savetxt(Blue,_,fmt='%d')
with open("Green.txt","w") as Green:
  for _ in g:
    np.savetxt(Green,_,fmt='%d')
Red.close()
Blue.close()
Green.close()
```

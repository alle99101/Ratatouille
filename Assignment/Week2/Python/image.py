import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from PIL import *

img = Image.open('Sasha.PNG').convert('LA')
img.save('greyscale.png')

def rgb2gray(rgb):
    return np.dot(rgb[...,:3], [0.2999, 0.587, 0.114])

img = mpimg.imread('Sasha.PNG')     
gray = rgb2gray(img)    
plt.imshow(gray, cmap=plt.get_cmap('gray'), vmin=0, vmax=1)
plt.show()

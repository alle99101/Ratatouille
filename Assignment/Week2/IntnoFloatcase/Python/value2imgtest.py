import numpy as np
import cv2 as cv

def rgb2gray(r,g,b):
    gray = (0.2989*r + 0.5870*g + 0.1140*b) / 255
    return gray
    
image = np.zeros((500, 500, 3), np.uint8)

sb = open('outputblue.txt', 'r')
sg = open('outputgreen.txt', 'r')
sr = open('outputred.txt', 'r')

pixelsb = []
pixelsg = []
pixelsr = []

for x1 in sb:
    pixelsb.append(int(x1,2))
for x2 in sg:
    pixelsg.append(int(x2,2))
for x3 in sr:
    pixelsr.append(int(x3,2))

i = 0
j = 0
k = 0

for i in range(500):
    for j in range(500):
        image[i, j] = (pixelsb[k], pixelsg[k], pixelsr[k])
        k = k + 1

# Write image
cv.imwrite('verilogsashatest.PNG', image)
cv.imshow('Color',image)
b,g,r = cv.split(image)
img_gray = rgb2gray(r, g, b)
cv.imshow('Gray',img_gray)
cv.waitKey()
cv.destroyAllWindows()
sb.close()
sg.close()
sr.close()
import cv2 as cv
import numpy

img = cv.imread('Sasha.PNG')
img = cv.resize(img, (300,300))
img_width = img.shape[0]
img_height = img.shape[1]

i = 0
j = 0
svalue = open('rgbvalue.txt','w')
for i in range(img_height):
    for j in range(img_width):
        red = img[i,j][2]
        green = img[i,j][1]
        blue = img[i,j][0] 

        svalue.write(bin(red)[2:].zfill(8)+" "+bin(green)[2:].zfill(8)+" "+bin(blue)[2:].zfill(8))

svalue.close()
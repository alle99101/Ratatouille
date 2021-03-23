import numpy
import cv2
import ctypes

imageraw = cv2.imread('sasha.jpg')
image = cv2.resize(imageraw,dsize=(500,500))

sr = open('redfloat.txt','w')
sg = open('greenfloat.txt','w')
sb = open('bluefloat.txt','w')

for i in range(0,500):
    for j in range(0,500):
        r = image[i,j][2]
        g = image[i,j][1]
        b = image[i,j][0]

        floatred = bin(ctypes.c_uint.from_buffer(ctypes.c_float(r)).value)
        sr.write("0")
        sr.write(floatred[2:])
        sr.write("\n")

        floatgreen = bin(ctypes.c_uint.from_buffer(ctypes.c_float(g)).value)
        sg.write("0")
        sg.write(floatgreen[2:])
        sg.write("\n")

        floatblue = bin(ctypes.c_uint.from_buffer(ctypes.c_float(b)).value)
        sb.write("0")
        sb.write(floatblue[2:])
        sb.write("\n")
        
cv2.imwrite('sasharesize.jpg',image)
sr.close()
sg.close()
sb.close()
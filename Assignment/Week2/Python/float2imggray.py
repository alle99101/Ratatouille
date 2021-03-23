import numpy as np
import cv2

from codecs import decode
import struct

gray = open('grayfloat.txt','r')
grayvalue = open('grayfinal.txt','w' )
image = np.zeros((500,500,3),np.uint8)
pixel = []

def bin_to_float(binary):
    return struct.unpack('f',struct.pack('I', int(binary, 2)))[0]

i = 0
j = 0
f = 0
for x in gray:
    pixel.append(int(bin_to_float(x)))
    grayvalue.write(x)

for i in range (0,500):
    for j in range(0,500):
        image[i, j] = (pixel[f], pixel[f], pixel[f])
        f = f+1


cv2.imwrite('Verilog_Sasha.jpg',image)
cv2.imshow('Verilog_Sasha',image)

cv2.waitKey()
cv2.destroyAllWindows()


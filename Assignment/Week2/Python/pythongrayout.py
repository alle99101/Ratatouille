import cv2
import numpy as np 
import struct

image = cv2.imread('sasha.jpg')
img1 = cv2.resize(image ,(500,500))
out = cv2.imwrite("img2.jpg",img1)

img2 = cv2.imread('img2.jpg')
b = img2[:,:,0].flatten()
r = img2[:,:,2].flatten()
g = img2[:,:,1].flatten()

np.savetxt("red.txt",r,fmt="%d",delimiter=' ')
np.savetxt("blue.txt",b,fmt="%d",delimiter=' ')
np.savetxt("green.txt",g,fmt="%d",delimiter=' ')

def RGB_GrayScale(r,b,g):
   Y= (0.2989*r + 0.5875*b + 0.114*g)/255
   return Y 
   

def bin2float(b):
    ''' Convert binary string to a float.

    Attributes:
        :b: Binary string to transform.
    '''
    h = int(b, 2).to_bytes(8, byteorder="big")
    return struct.unpack('>d', h)[0]


def float2bin(f):
    ''' Convert float to 64-bit binary string.

    Attributes:
        :f: Float number to transform.
    '''
    [d] = struct.unpack(">Q", struct.pack(">d", f))
    return f'{d:064b}'
    
gray_img = RGB_GrayScale(r,g,b)
gray_img = np.array(gray_img) 
gray_img = gray_img.astype("float32")
bin_gray = np.array([float2bin(float(fl)) for fl in gray_img])

np.savetxt("gray_img.txt", bin_gray, delimiter=", ",fmt="%10.32s")

gray_file = open("gray_img.txt",'r')
lines = gray_file.readlines()
img = np.zeros((500,500), dtype=float)
count = 0
for i in range(0,500):
  for j in range(0,500):
    img[i][j] = bin2float(lines[count][:-1]+"0"*32)
    count = count + 1
cv2.imshow("gray_test", img)
cv2.imwrite("gray_test.jpg",img)
cv2.waitKey(0)
cv2.destroyAllWindows()
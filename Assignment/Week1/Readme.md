# 1. Cài đặt Python trên Linux
[Python 3 Install](https://phoenixnap.com/kb/how-to-install-python-3-ubuntu?fbclid=IwAR2zAj1ch50GrUVz_Ybc8PQXqyZ94AFTNSqrq__6TIf6ZNloRFy0jiffVcE)
# 2. Cài đặt OpenCV Packages
[OpenCV Ubuntu](https://docs.opencv.org/master/d2/de6/tutorial_py_setup_in_ubuntu.html)
# 3. Tiến hành Code
## *Read/Display Video
```python
import numpy as np
import cv2

cap = cv2.VideoCapture('abc.mp4')

while(cap.isOpened()):
    ret, frame = cap.read()

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    cv2.imshow('frame',gray)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
```
Với "abc.mp4" là file video muốn mở

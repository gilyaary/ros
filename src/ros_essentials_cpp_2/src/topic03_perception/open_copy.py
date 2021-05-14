#!/usr/bin/env python

#import numpy: the data structure that will handle an image
import numpy as np

#import openCV
import cv2
 

#image_name = "flower"
#image_name = "chess"
image_name = "tree"


print ('read an image from file')
img = cv2.imread("images/"+image_name+".jpg", 2)
#img = cv2.imread("images/"+image_name+".jpg")

print(img[0:10, 0:10, ])


bw_img = img
ret, bw_img = cv2.threshold(img,50,255,cv2.THRESH_BINARY_INV)

'''
img.type - the data type of the object
img.size - size in bytes = dim0*dim1*dim3
img.shape - a tupe of the dimentions like (150,300,3)
img.shape[0] - length of the 0 dim i.e. rows
img.shape[1] - length of the 1 dim i.e. cols
img.shape[2] - length of the 2 dim i.e. channels - BGR
img.dtype - the data type of elements of the array i.e uint8
length, width, channels = img.shape - a way to assign the dimension to variables
'''



print ('create a window holder for the image')
cv2.namedWindow("Image",cv2.WINDOW_NORMAL)

print ('display the image')
cv2.imshow("Image", bw_img)

print ('press a key inside the image to make a copy')
cv2.waitKey(0)
cv2.destroyAllWindows()

print ('image copied to folder images/copy/')
cv2.imwrite("images/copy/"+image_name+"-copy.jpg",bw_img)

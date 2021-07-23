#!/usr/bin/env python3


import pytesseract as tess
from difflib import SequenceMatcher
from skimage import data, io
from skimage.filters import threshold_local
image = data.page()


original_text = "Region-based segmentation\n\nLet us first determine markers of the coins and the\nbackground. These markers are pixels that we can label\nunambiguously as either object or background. Here,\nthe markers are found at the two extreme parts of the\nhistogram of grey values:\n\n\n\x0c"


#for i in range (9, 99, 2):
#    print(i)
#    block_size = i
#    local_thresh = threshold_local(image, block_size, offset=10)
#    binary_local = image > local_thresh
#    ocr_text = tess.image_to_string(binary_local)
#    print(SequenceMatcher(None, original_text, ocr_text).ratio())
#    print('---------------------')


#for i in range (0, 20, 1):
#    print(i)
#    block_size = 99
#    local_thresh = threshold_local(image, block_size, offset=i)
#    binary_local = image > local_thresh
#    ocr_text = tess.image_to_string(binary_local)
#    print(SequenceMatcher(None, original_text, ocr_text).ratio())
#    print('---------------------')

block_size = 99
local_thresh = threshold_local(image, block_size, offset=30)
binary_local = image > local_thresh
ocr_text = tess.image_to_string(binary_local)
print(original_text)
#print(repr(original_text))
print('-------------------')
print(ocr_text)
#print(repr(ocr_text))
print('-------------------')
#print(SequenceMatcher(None, original_text, ocr_text).get_matching_blocks())
print(SequenceMatcher(None, original_text, ocr_text).ratio())


io.imshow(binary_local)
io.show()

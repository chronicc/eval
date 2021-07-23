#!/usr/bin/env python3


from skimage import data, io
image = data.camera()

print('Type: %s' % type(image))
print('Shape: %s' % repr(image.shape))
print('Size: %s' % image.size)
print('Min: %s' % image.min())
print('Max %s' % image.max())
print('Length: %s' % len(image))

image[:10] = 0

mask = image < 87
image[mask] = 255

io.imshow(image)
io.show()


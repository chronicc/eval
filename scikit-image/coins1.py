#!/usr/bin/env python3

from skimage import data, io, filters


image = data.coins()
edges = filters.sobel(image)
io.imshow(edges)
io.show()

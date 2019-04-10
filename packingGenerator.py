#!/usr/bin/python
import random
import sys

# size of grid
size = 20

print("area(%d,%d).") % (size,size)

# generate blocks
numSquares = int(sys.argv[1])
print("max_num_squares(%d).") %(numSquares)

for i in range(numSquares):
        squareSize = random.randint(1,size/3)
        print("square(%d,%d).") %(i,squareSize)

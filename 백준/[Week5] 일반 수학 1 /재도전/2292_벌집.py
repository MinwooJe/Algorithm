n = int(input())

count = 1
layer = 1

while n > count:
    count += 6 * layer
    layer += 1

print(layer)
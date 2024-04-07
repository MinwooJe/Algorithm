a, b, c = sorted([int(x) for x in input().split()])
result = 0

if c >= a + b:
    c = a + b - 1

print(a + b + c)
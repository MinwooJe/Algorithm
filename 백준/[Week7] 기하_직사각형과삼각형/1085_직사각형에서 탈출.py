x, y, w, h = map(int, input().split())
a = w - x
b = x
c = h - y
d = y

print(min(a, b, c, d))
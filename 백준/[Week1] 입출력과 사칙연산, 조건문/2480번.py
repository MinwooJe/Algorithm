# 첫 번째 풀이
a, b, c = map(int, input().split())
max_value = max(a, b, c)

if a == b == c:
    print(10000 + (1000 * a))
elif a == b or a == c or b == c:
    if a == b:
        print(1000 + (a * 100))
    elif a == c:
        print(1000 + (a * 100))
    elif b == c:
        print(1000 + (b * 100))
else:
    print(max_value * 100)

# 두 번째 풀이
a, b, c = sorted(map(int, input().split()))

if a == b == c:
	print(10000 + a * 1000)
elif a != b != c:
	print(c * 100)
else:
	print(1000 + b * 100)
while True:
    a, b, c = sorted([int(x) for x in input().split()])     # 파이썬의 언패킹
    if a == 0 and b == 0 and c == 0:
        break

    if c >= a + b:
        print('Invalid')
    elif a == b == c:
        print('Equilateral')
    elif a == b or b == c or c == a:
        print('Isosceles')
    else:
        print('Scalene')
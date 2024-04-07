while True:
    a, b, c = map(int, input().split())
    maximum = max([a, b, c])
    if a == 0 and b == 0 and c == 0:
        break

    if maximum >= a + b:
        print('Invalid')
    elif a == b == c:
        print('Equilateral')
    elif a == b or b == c or c == a:
        print('Isosceles')
    else:
        print('Scalene')


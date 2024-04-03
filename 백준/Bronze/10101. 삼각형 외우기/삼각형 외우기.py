a = int(input())
b = int(input())
c = int(input())

sum = a + b + c

if sum > 180 or sum < 180:
    print('Error')
elif a == b == c:
    print('Equilateral')
elif a != b and b != c and c != a:
    print('Scalene')
else:
    print('Isosceles')
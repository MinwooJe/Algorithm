n, b= map(int, input().split())
result = ''

while n != 0:
    if (n % b) >= 10:
        result += chr((n % b) - 10 + 65)
    else:
        result += str(n % b)
    n = n // b

print(result[::-1])
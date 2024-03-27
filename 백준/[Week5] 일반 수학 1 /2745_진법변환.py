n, b = input().split()
b = int(b)
result = 0

for i in range(len(n)):
    if '0' <= n[i] <= '9':
        temp = int(n[i])
    else:
        temp = ord(n[i]) - ord('A') + 10
    result += temp * (b ** (len(n) -i -1))

print(result)

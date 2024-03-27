n = int(input())
i = 1
level = 1

while n > level:
    level += i * 6
    i += 1

print(i)
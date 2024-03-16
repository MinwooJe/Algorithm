a = []

for i in range(9):
    x = int(input())
    a.append(x)

print(max(a))
print(a.index(max(a)) + 1)
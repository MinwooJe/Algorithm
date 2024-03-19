a = []
max = -1
n, m = 0, 0

for i in range(9):
    row = list(map(int, input().split()))
    a.append(row)

for i in range(9):
    for j in range(9):
        if max < a[i][j]:
            max = a[i][j]
            n = i; m = j

print(max)
print(n + 1, m + 1)
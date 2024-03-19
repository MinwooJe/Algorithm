n = int(input())
paper = [[0 for _ in range(100)] for _ in range(100)]
count = 0

for i in range(n):
    c, r = map(int, input().split())
    r = 100 - r
    for j in range(10):
        for k in range(10):
            paper[r-j][c+k] = 1

for i in range(100):
    for j in range(100):
        if paper[i][j] == 1:
            count += 1
print(count)
n, m = map(int, input().split())
data = [0 for i in range(n)]

for i in range(m):
    a, b, c = map(int, input().split())
    temp = [c for i in range(b-a+1)]
    data[a-1:b] = temp

for i in range(n):
    print(data[i], end=' ')
a = list(map(int, input().split()))
b =[1, 1, 2, 2, 2, 8]
for i in range(6):
    temp = b[i] - a[i]
    print(temp, end=' ')
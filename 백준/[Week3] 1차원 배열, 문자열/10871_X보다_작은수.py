n, x = map(int, input().split())
a = list(map(int, input().split()))

for i in range(n):
    if a[i] < x:
        print(a[i], end = ' ')


# 줄바꿈하지 않고 띄어쓰기로 출력하는 방법
# print(a[i],l end = ' ')

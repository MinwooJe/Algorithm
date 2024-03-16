n = int(input())

a = []
b = []

for i in range(n):
    t1, t2 = map(int, input().split())
    a.append(t1)
    b.append(t2)

for i in range(n):
    print(a[i] + b[i])

# 두 번째 풀이
n = int(input())

for i in range(1, n+1):
	a, b = map(int, input().split())
	print(a + b)
n, m = map(int, input().split())
basket = [i + 1 for i in range(n)]
temp = []

for i in range(m):
    a, b = map(int, input().split())
    temp = basket[a-1:b]
    temp = list(reversed(temp))
    basket[a-1:b] = temp

for i in range(n):
    print(basket[i], end=' ')

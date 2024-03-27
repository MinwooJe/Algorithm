n = int(input())
m = int(input())
prime_list = []

for i in range(n, m+1):
    if i == 1:
        continue
    temp = 0
    for j in range(2, i):
        if i % j == 0:
            temp += 1
    if temp == 0:
        prime_list.append(i)
if prime_list != []:
    print(sum(prime_list))
    print(min(prime_list))
else:
    print(-1)

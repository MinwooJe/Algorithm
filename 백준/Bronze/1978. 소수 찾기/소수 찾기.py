n = int(input())
lst = list(map(int,input().split()))
count = 0
temp = 0

for i in lst:
    for j in range(2, i):
        if i != 1 and i % j == 0:     # 1과 자기자신 외에 약수 있다면 temp에 1 추가
            temp += 1
    if temp == 0 and i != 1:
        count += 1
    temp = 0

print(count)
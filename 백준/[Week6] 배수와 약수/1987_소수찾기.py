n = int(input())
lst = list(map(int,input().split()))
count = 0

for i in lst:
    if i == 1:
        continue
    temp = 0                # i가 1일 때 continue를 한 후 temp를 0으로 초기화
    for j in range(2, i):
        if i % j == 0:     # 1과 자기자신 외에 약수 있다면 temp에 1 추가
            temp += 1
    if temp == 0:
        count += 1
    temp = 0

print(count)
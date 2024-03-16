# 변수명 sum -> total로 변경. sum은 파이썬 내장함수 이름이므로
n = int(input())

total = 0

for i in range(1, n+1):
    total += i

print(total)

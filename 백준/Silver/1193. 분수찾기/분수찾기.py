n = int(input())
cnt = 1
d = 1
while n > cnt:
    d += 1
    cnt += d

s = d + 1       # 분자 분모의 합
reverse_index = cnt - n

if d % 2 == 1:
    b = s - 1  # 첫 분모 : 합에서 1빼면 됨.
    a = s - b  # 첫 분자 : 합에서 b빼기
    for i in range(reverse_index):
        a += 1
        b -= 1
else:
    a = s - 1  # 첫 분자 : 합에서 1빼면 됨.
    b = s - a  # 첫 분모 : 합에서 a빼기
    for i in range(reverse_index):
        a -= 1
        b += 1

print(f'{a}/{b}')

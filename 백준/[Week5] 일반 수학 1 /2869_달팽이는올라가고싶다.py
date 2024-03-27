# 시간초과 풀이
# a, b, v = map(int, input().split())
#
# count = 0
# up = a - b
#
# while v > a:
#     v -= up
#     count += 1
#
# print(count + 1)

a, b, v = map(int, input().split())

up = a - b
goal = v - b

if goal % up == 0:
    print(goal//up)
else:
    print(goal//up + 1)
n = int(input())
count_point = 2

for i in range(n):
    count_point += count_point - 1
print(count_point**2)
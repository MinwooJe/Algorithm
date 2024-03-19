matrix = [input() for _ in range(5)]
result = ''

for i in range(15):
    for j in matrix:
        if i < len(j):
            result += j[i]

print(result)
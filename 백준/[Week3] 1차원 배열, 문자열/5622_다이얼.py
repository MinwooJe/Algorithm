s = list(input())
a = ['ABC', 'DEF', 'GHI', 'JKL', 'MNO', 'PQRS', 'TUV', 'WXYZ']
sum = 0

for i in s:
    for idx, j in enumerate(a):
        if i in j:
            sum += idx + 3
print(sum)

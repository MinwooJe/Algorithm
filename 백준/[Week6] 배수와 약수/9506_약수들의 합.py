factor = []
sum = 0
result = ''

while True:
    a = int(input())

    if a == -1:
        break

    for i in range(1, a):
        if a % i == 0:
            factor.append(i)
            sum += i

    if a != sum:
        print(f'{a} is NOT perfect.')
    else:
        result = f'{a} = {factor[0]}'
        for i in range(1, len(factor)):
            result += f' + {factor[i]}'
        print(result)

    sum = 0
    factor.clear()
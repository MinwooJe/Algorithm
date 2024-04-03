def sieve_of_eratosthenes(a):
    numbers = [x for x in range(a+1)]
    end = int(a**(1/2))
    for i in range(2, end+1):
        if numbers[i] == 0:
            continue
        for j in range(i+i, a+1, i):    # 자기 자신을 제외한 i의 배수는 모두 0으로 처리함.
            numbers[j] = 0
    return [i for i in numbers[2:] if numbers[i]]
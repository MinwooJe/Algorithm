def solution(n):
    numbers = [x for x in range(n+1)]
    end = int(n**(1/2))
    
    for i in range(2, end+1):
        if numbers[i] == 0:
            continue
        for j in range(i+i, n+1, i):
            numbers[j] = 0
    answer = [i for i in numbers[2:] if numbers[i]]
    return len(answer)
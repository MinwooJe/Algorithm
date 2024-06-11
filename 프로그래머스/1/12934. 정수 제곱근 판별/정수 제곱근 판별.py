def solution(n):
    end = int(n ** 0.5)
    for i in range(1, end+1):
        if i*i == n:
            return (i+1)**2
    return -1
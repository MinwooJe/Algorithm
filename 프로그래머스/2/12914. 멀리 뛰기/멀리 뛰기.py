def solution(n):
    if n == 1 or n == 2:
        return n

    memo = [0 for _ in range(n)]
    (memo[0], memo[1]) = (1, 2)
    
    for i in range(2, n):
        memo[i] = (memo[i-1] + memo[i-2]) % 1234567
    
    return memo[n-1]
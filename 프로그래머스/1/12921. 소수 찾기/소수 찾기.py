def solution(n):
    end = int(n**0.5)
    nums = [i for i in range(n+1)]
    
    for i in range(2, n+1):
        for i in range(2*i, n+1, i):
            nums[i] = 0
    
    return len([i for i in nums if i != 0][1:])
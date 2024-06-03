def solution(n):
    nums = [i for i in range(n+1)]
    end = int(n**0.5) + 1
    
    for i in range(2, end):
        if nums[i] == 0:
            continue
        for j in range(i+i, n+1, i):
            nums[j] = 0
    answer = len([i for i in nums[2:] if nums[i]])
    
    return answer
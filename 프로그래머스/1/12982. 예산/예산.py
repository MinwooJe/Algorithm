def solution(d, budget):
    answer = 0
    sum_d = 0
    d.sort()
    
    for i in d:
        sum_d += i
        if sum_d > budget:
            break
        else:
            answer += 1
    
    return answer
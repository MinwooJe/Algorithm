def solution(d, budget):
    d.sort()
    i = 0
    answer = 0
    
    for b in d:
        if budget - b >= 0:
            budget -= b
            answer += 1
    
    return answer
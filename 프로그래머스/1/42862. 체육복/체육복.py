def solution(n, lost, reserve):
    intersection = set(lost).intersection(reserve)
    lost = set(lost) - intersection
    reserve = set(reserve) - intersection
    
    answer = n - len(lost)
    
    for i in lost:
        if i-1 in reserve:
            lost.remove(i)
            reserve.remove(i-1)
            answer += 1
        elif i+1 in reserve:
            lost.remove(i)
            reserve.remove(i+1)
            answer += 1
        
    return answer
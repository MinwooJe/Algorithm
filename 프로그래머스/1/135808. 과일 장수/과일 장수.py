def solution(k, m, score):
    answer = 0
    min_score = []
    
    n = len(score) // m
    score.sort(reverse=True)
    for i in range(n):
        min_score.append(min(score[i*m:i*m + m]))
    for i in min_score:
        answer += m * i
    return answer
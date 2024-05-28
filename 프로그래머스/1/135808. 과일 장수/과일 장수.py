def solution(k, m, score):
    answer = 0
    min_score = []
    rep = len(score) // m
    score.sort(reverse=True)
    
    for i in range(rep):
        min_score.append(min(score[i*m:i*m+m]))
    for i in min_score:
        answer += i*m
    return answer
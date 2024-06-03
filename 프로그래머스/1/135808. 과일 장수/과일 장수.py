def solution(k, m, score):
    score.sort(reverse=True)
    answer = 0
    n = len(score) // m
    for i in range(n):
        answer += min(score[m*i:m*i+m]) * m
    return answer
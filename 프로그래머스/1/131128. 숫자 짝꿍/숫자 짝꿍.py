def solution(X, Y):
    answer = ''
    for i in range(9, -1, -1):
        answer += str(i) * min(X.count(str(i)), Y.count(str(i)))
    
    if not answer:
        return '-1'
    elif answer.count('0') == len(answer):
        return '0'
    else:
        return answer
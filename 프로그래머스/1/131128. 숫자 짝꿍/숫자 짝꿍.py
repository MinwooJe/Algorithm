def solution(X, Y):
    answer = ''
    for i in range(9, -1, -1):
        i = str(i)
        answer += i * min(X.count(i), Y.count(i))
    
    if len(answer) > 0 and len(answer) == answer.count('0'):
        answer = '0'
    
    if answer:
        return answer
    else:
        return '-1'
    
def solution(dartResult):
    dartResult = dartResult.replace('10', 'X')
    answer = []
    for i in dartResult:
        if i.isdigit():
            answer.append(int(i))
        elif i == 'X':
            answer.append(10)
        elif i == 'D':
            answer[-1] **= 2
        elif i == 'T':
            answer[-1] **= 3
        elif i == '*':
            if len(answer) > 1:
                answer[-1] *= 2
                answer[-2] *= 2
            else:
                answer[-1] *= 2
        elif i == '#':
            answer[-1] *= -1
    return sum(answer)
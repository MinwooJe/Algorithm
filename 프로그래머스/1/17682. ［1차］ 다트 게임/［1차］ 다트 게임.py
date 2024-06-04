def solution(dartResult):
    result = []
    dartResult = dartResult.replace('10', 'x')
    for i in dartResult:
        if i.isdigit():
            result.append(int(i))
        if i == 'x':
            result.append(10)
        if i == 'S':
            continue
        if i == 'D':
            result[-1] **=  2
        if i == 'T':
            result[-1] **= 3
        if i == '*':
            result[-1] *= 2
            if len(result) > 1:
                result[-2] *= 2
        if i == '#':
            result[-1] *= -1
        print(result)
    answer = sum(result)
    return answer
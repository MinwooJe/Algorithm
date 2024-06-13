def solution(dartResult):
    dartResult = dartResult.replace('10', 'X')
    stack = []
    
    for i in dartResult:
        if i.isdigit():
            stack.append(int(i))
        elif i == 'X':
            stack.append(10)
        elif i == 'D':
            stack[-1] **= 2
        elif i == 'T':
            stack[-1] **= 3
        elif i == '*':
            stack[-1] *= 2
            if len(stack) > 1:
                stack[-2] *= 2
        elif i == '#':
            stack[-1] *= -1

    answer = sum(stack)
    
    return answer
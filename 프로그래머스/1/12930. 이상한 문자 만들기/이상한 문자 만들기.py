def solution(s):
    idx = 0
    answer = []
    for c in s:
        if c == ' ':
            idx = 0
            answer.append(' ')
            continue
            
        if idx % 2 == 0:
            answer.append(c.upper())
        else:
            answer.append(c.lower())

        idx += 1
    answer = ''.join(answer)
    return answer
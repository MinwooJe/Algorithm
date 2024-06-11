def solution(s):
    answer = ''
    idx = 0
    s = list(s)
    
    for i, c in enumerate(s):
        if c == ' ':
            idx = 0
            continue
        if idx == 0:
            s[i] = c.upper()
        else:
            s[i] = c.lower()
        idx += 1
        
    answer = ''.join(s)
    return answer

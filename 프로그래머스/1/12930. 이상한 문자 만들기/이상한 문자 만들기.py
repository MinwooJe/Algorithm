def solution(s):
    s = list(s)
    word_idx = 0
    
    for idx, c in enumerate(s):
        if c == ' ':
            word_idx = 0
        else:   
            if word_idx % 2 == 0:
                s[idx] = c.upper()
            else:
                s[idx] = c.lower()
            word_idx += 1
    
    return ''.join(s)
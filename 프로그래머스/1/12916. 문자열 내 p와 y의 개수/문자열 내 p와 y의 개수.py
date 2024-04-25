def solution(s):
    answer = True
    p_count = s.count('p')
    p_count += s.count('P')
    s_count = s.count('y')
    s_count += s.count('Y')

    if p_count != s_count:
        return False
    
    return True
def solution(s):
    answer = True
    s = s.lower()
    p_count = s.count('p')
    s_count = s.count('y')

    if p_count != s_count:
        return False
    
    return True
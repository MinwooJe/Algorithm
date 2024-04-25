def solution(s):
    answer = True 
    s_list = []
    
    if len(s) != 4 and len(s) != 6:
        return False
    
    for i in s:
        if 65 <= ord(i) <= 90 or 97 <= ord(i) <= 122:
            return False

    return answer
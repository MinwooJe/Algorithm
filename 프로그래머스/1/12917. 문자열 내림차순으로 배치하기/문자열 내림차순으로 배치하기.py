def solution(s):
    s_list = []
    answer = ''
    
    for i in s:
        s_list.append(i)
    
    s_list.sort(reverse=True)
    answer = ''.join(s_list)
        
    return answer
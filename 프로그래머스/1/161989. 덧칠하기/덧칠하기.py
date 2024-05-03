def solution(n, m, section):
    count = 1
    start = section[0]
    
    for i in section:
        if start + (m-1) < i:
            count += 1
            start = i
            
    return count
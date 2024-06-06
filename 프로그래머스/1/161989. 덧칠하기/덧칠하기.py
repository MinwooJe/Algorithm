def solution(n, m, section):
    count = 1
    start = section[0]
    
    for i in range(len(section)-1):
        if start + m > section[i+1]:
            continue
        else:
            start = section[i+1]
            count += 1
    
    return count
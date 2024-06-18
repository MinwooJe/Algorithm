def solution(s):
    iter_count, count_0 = 0, 0

    while s != '1':
        iter_count += 1
        count_0 += s.count('0')
        
        s = s.replace('0', '')
        c = len(s)
        s = bin(c)[2:]
        
    return [iter_count, count_0]
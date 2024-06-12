def solution(n):
    next_num = n + 1
    n_count = bin(n)[2:].count('1')
    
    while True:
        bi_next = bin(next_num)[2:]     # 1 더한 숫자 이진수로 변경
        next_count = bi_next.count('1') # 1 개수 구하기
        
        if next_count == n_count:
            return next_num
        else:
            next_num += 1
            continue
        
        
        
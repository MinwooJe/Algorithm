def solution(n):
    x = bin(n + 1)
    n = bin(n)
    target_count = n.count('1')
    
    while x.count('1') != target_count:
        x = int(x, 2) + 1
        x = bin(x)
        
    return int(x, 2)
        
        
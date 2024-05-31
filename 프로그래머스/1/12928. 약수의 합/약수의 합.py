def solution(n):
    answer = set()   # n이 제곱수일때 i == n/i이므로 중복 제거 위해 set 사용
    answer.add(n)      
    
    for i in range(1, int(n**0.5)+1):
        if n % i == 0:
            answer.add(i)
            answer.add(n/i) 
            
    return sum(answer)

def solution(n):
    end = int(n**0.5)
    answer = 0
    
    for i in range(1, end+1):
        if n % i == 0:
            print(i, n//i)
            answer += i
            if i**2 != n:
                answer += n // i
                
    return answer

def solution(number, limit, power):
    atk = []
    for i in range(1, number+1):
        atk.append(count_divisor(i))
    
    for i in range(len(atk)):
        if atk[i] > limit:
            atk[i] = power
            
    return sum(atk)
        

def count_divisor(n):
    end = int(n**0.5) + 1
    count = 0
    for i in range(1, end):
        if n % i == 0:
            if n == i*i:
                count += 1
            else:
                count += 2
    return count

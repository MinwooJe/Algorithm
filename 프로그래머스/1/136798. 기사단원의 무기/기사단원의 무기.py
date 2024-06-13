def solution(number, limit, power):
    knight = []
    
    for i in range(1, number+1):
        if get_divisor_count(i) > limit:
            knight.append(power)
        else:
            knight.append(get_divisor_count(i))
    
    return sum(knight)
        
        
def get_divisor_count(n):
    end = int(n**0.5)
    count = 0
    for i in range(1, end+1):
        if n % i == 0:
            if i**2 == n:
                count += 1
            else:
                count += 2
    return count
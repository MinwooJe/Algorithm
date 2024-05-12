def solution(number, limit, power):
    answer = 0
    power_list = []
    
    for i in range(1, number + 1):
        count = 0
        for j in range(1, int(i ** (1/2)) + 1):
            if i == j*j:
                count += 1
            elif i % j == 0:
                count += 2
        power_list.append(count)
    
    for idx, value in enumerate(power_list):
        if value > limit:
            power_list[idx] = power
    
    answer = sum(power_list)
        
    return answer
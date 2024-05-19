def solution(food):
    answer = ''
    temp = ''
    
    for i in range(1, len(food)):
        if food[i] % 2 != 0:
            food[i] -= 1
            food[i] //= 2
        else:
            food[i] //= 2
    
    for i in range(1, len(food)):
        temp += str(i) * food[i]
        
    answer = temp + '0' + temp[::-1]
    
    return answer
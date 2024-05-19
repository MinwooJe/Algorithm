def solution(food):
    answer = ''
    temp = ''
    
    for i in range(1, len(food)):
        food[i] //= 2        # 어차피 몫을 구하니 홀수도 상관 없음
        temp += str(i) * food[i]
        
    answer = temp + '0' + temp[::-1]
    
    return answer
def solution(food):
    half = ''
    answer = ''
    
    for i in range(1, len(food)):
        half += str(i) * (food[i]//2)
    
    answer = half + '0' + half[::-1]
    return answer
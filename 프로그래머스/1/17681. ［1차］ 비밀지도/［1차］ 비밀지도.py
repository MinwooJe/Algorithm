def solution(n, arr1, arr2):
    answer = []
    
    # 비트연산을 통해 최종 벽을 만들기
    for i in range(n):
        answer.append(bin(arr1[i] | arr2[i])[2:])
    print(answer)
    
    # 길이가 부족한 경우 예외 처리
    for i in range(len(answer)):
        len_dif = len(max(answer)) - len(answer[i]) 
        if len_dif > 0:
            answer[i] = '0' * len_dif + answer[i]
            
    # 1, 0으로 구성된 지도를 #과 공백으로 바꾸기
    for idx, value in enumerate(answer):
        answer[idx] = value.replace('1', '#')
        answer[idx] = answer[idx].replace('0', ' ')
    return answer

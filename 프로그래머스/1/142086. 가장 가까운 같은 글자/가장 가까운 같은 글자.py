def solution(s):
    # 가장 최근에 나온 문자의 인덱스 저장
    char_dict = {}
    answer = [0] * len(s) 
    
    for idx, value in enumerate(s):
        if value in char_dict:
            answer[idx] = idx - char_dict[value]
        else:
            answer[idx] = -1
            
        char_dict[value] = idx
    
    return answer
        
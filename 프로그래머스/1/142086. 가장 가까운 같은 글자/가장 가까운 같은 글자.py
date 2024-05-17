def solution(s):
    answer = []
    char_dict = {}   # 가장 최근에 나온 문자의 인덱스를 저장하는 딕셔너리
    
    for i in range(len(s)):
        if s[i] not in char_dict:
            answer.append(-1)
        else:
            answer.append(i - char_dict[s[i]])
        char_dict[s[i]] = i
    return answer
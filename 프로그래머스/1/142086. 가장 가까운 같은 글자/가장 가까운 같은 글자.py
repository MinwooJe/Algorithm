def solution(s):
    answer = []
    exist_char = []
    nearest_index = 0

    for i in range(len(s)):
        if s[i] not in exist_char:
            exist_char.append(s[i])
            answer.append(-1)
        else:
            for j in range(i):
                if s[i] == s[j]:        # j < i
                    nearest_index = j
            answer.append(i - nearest_index)
            
    return answer
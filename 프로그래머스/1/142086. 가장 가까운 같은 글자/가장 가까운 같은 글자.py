def solution(s):
    answer = [0 for _ in range(len(s))]
    for i in range(len(s)):
        for j in range(i):
            if s[i] == s[j]:
                answer[i] = i - j
    print(answer)
    for i in range(len(answer)):
        if answer[i] == 0:
            answer[i] = -1
            
    return answer
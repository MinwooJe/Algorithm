def solution(myString, pat):
    answer = 0
    for i in range(len(myString)):
        target = myString[i:i+len(pat)]
        if pat in target:
            answer += 1
    return answer
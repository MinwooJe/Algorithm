def solution(n):
    answer = []
    for i in str(n):
        answer.append(i)
    answer = sorted(answer)[::-1]
    answer = int(''.join(answer))
    return answer
def solution(strings, n):
    answer = sorted(strings, key=lambda str:(str[n], str))
    return answer
def solution(myString, pat):
    answer = ''
    index = myString.rfind(pat) + len(pat)
    answer = myString[:index]
    return answer
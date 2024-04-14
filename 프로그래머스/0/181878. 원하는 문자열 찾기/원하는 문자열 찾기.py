def solution(myString, pat):
    answer = 0
    return int(pat.lower() in myString.lower())
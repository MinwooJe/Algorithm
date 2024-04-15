def solution(myString, pat):
    answer = 0
    myString = myString.replace('A', '*')
    myString = myString.replace('B', 'A')
    myString = myString.replace('*', 'B')
    if pat in myString:
        answer = 1

    return answer
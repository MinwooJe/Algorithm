def solution(myString):
    answer = []
    myString = myString.replace('x', ' ')
    answer = myString.split()
    answer.sort()
    return answer
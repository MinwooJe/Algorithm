def solution(num):
    answer = 0
    for i in range(1, num+1):
        summation = 0
        while summation < num:
            summation += i
            i += 1
        if summation == num:
            answer += 1
    return answer
def solution(my_string, queries):
    answer = my_string
    i = 1
    for q in queries:
        if q[0] == 0 and q[1] == len(my_string):
            answer = answer[:q[0]] + answer[q[1]::-1] + answer[q[1]:]
        elif q[0] == 0:
            answer = answer[:q[0]] + answer[q[1]::-1] + answer[q[1]+1:]
        elif q[1] == len(my_string):
            answer = answer[:q[0]] + answer[q[1]:q[0]-1:-1] + answer[q[1]:]
        else:
            answer = answer[:q[0]] + answer[q[1]:q[0]-1:-1] + answer[q[1]+1:]

    return answer
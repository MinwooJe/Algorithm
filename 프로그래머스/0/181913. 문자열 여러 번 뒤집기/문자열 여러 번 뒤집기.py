def solution(my_string, queries):
    answer = list(my_string)
    for i in queries:
        answer[i[0]:i[1]+1] = answer[i[0]:i[1]+1][::-1]
    
    answer = ''.join(answer)
    return answer

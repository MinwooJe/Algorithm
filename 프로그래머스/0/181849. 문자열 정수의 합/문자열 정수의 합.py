def solution(num_str):
    answer = 0
    num_list = list(num_str)
    for i in num_list:
        answer += int(i)
    return answer
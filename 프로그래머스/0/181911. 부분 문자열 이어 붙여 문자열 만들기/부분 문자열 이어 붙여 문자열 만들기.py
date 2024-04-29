def solution(my_strings, parts):
    answer = list()
    for idx, part in enumerate(parts):
        s, e = part
        answer += list(my_strings[idx][s:e+1])
    answer = ''.join(answer)
    return answer
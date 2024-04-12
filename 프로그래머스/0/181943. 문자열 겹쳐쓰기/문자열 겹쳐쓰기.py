def solution(my_string, overwrite_string, s):
    answer = ''
    my_front_string = my_string[:s]
    my_back_string = my_string[s+len(overwrite_string):]
    answer = my_front_string + overwrite_string + my_back_string
    return answer
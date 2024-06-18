def solution(s):
    s_list = list(map(int, s.split()))
    maximum, minimum = str(max(s_list)), str(min(s_list))
    return  minimum + ' ' + maximum
    
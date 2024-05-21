def solution(str1, str2):
    answer = 0
    
    str1_list = del_not_alpha(split_str(str1.lower()))
    str2_list = del_not_alpha(split_str(str2.lower()))
    return calculate_jarcard(str1_list, str2_list)

def split_str(str):
    str_list = []
    for i in range(len(str)-1):
        str_list.append(str[i:i+2])
    return str_list

def del_not_alpha(str_list):
    not_alpha_list = []
    for s in str_list:
        if s.isalpha():
            not_alpha_list.append(s)
    return not_alpha_list

def calculate_jarcard(split_alpha_list_1, split_alpha_list_2):
    j = 0
    union = []
    intersection = []
    if split_alpha_list_1 == split_alpha_list_2 == []:
        return 65536
    else:
        # 합집합 원소 구하기
        union_temp = split_alpha_list_1[:]
        union = split_alpha_list_1[:]
        for i in split_alpha_list_2:
            if i not in union_temp:
                union.append(i)
            else:
                union_temp.remove(i)
                
        # 교집합 원소 구하기
        for i in split_alpha_list_1:
            if i in split_alpha_list_2:
                split_alpha_list_2.remove(i)
                intersection.append(i)
        print(intersection)
        j = int((len(intersection) / len(union) ) * 65536)
    return j
    
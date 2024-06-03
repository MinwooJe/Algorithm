def solution(t, p):
    answer = 0
    sub_list = []
    for i in range(len(t)-len(p)+1):
        sub_list.append(t[i:i+len(p)])
    print(sub_list)
    for i in sub_list:
        if int(i) <= int(p):
            answer += 1
    return answer
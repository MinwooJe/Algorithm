def solution(name, yearning, photo):
    dict_yearning = dict(zip(name, yearning))
    sum = 0
    answer = []
    for p in photo:
        for i in p:
            try:
                sum += dict_yearning[i]
            except:
                sum += 0
        answer.append(sum)
        sum = 0
    return answer
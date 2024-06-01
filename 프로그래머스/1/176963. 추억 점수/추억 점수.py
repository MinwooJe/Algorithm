def solution(name, yearning, photo):
    answer = []
    score_dict = {n : y for n, y in zip(name, yearning)}
    
    for pho in photo:
        sum = 0
        for n in pho:
            if n in score_dict:
                sum += score_dict[n]
        answer.append(sum)
        
    return answer
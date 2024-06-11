def solution(name, yearning, photo):
    yearning_hash = {}
    answer = []
    for k, v in zip(name, yearning):
        yearning_hash[k] = v
    
    for p in photo:
        score = 0
        for i in p:
            if i in yearning_hash:
                score += yearning_hash[i]
        answer.append(score)
    return answer
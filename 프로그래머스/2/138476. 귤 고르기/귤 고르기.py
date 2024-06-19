def solution(k, tangerine):
    count_hash = {}
    answer = 0
    summation = 0

    for t in tangerine:
        if t in count_hash:
            count_hash[t] += 1
        else:
            count_hash[t] = 1

    count_list = sorted(count_hash.values(), reverse=True)
    
    i = 0
    while summation < k:
        summation += count_list[i]
        i += 1
        answer += 1
    
    return answer
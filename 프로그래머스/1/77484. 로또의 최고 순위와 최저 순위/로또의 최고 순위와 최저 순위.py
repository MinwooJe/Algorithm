def solution(lottos, win_nums):
    rank = [6, 6, 5, 4, 3, 2, 1]
    count = 0
    zero_count = lottos.count(0)
    
    for i in lottos:
        if i in win_nums:
            count += 1
            
    min_rank = rank[count]
    max_rank = rank[zero_count + count]
    
    return [max_rank, min_rank]
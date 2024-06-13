def solution(lottos, win_nums):
    # 맞힌 개수 : 점수
    rank_hash = {6:1, 5:2, 4:3, 3:4, 2:5, 1:6, 0:6}
    min_count = 0
    
    for i in lottos:
        if i in win_nums:
            min_count += 1
    
    max_count = min_count + lottos.count(0)
    max_rank, min_rank = rank_hash[max_count], rank_hash[min_count]
    
    return [max_rank, min_rank]
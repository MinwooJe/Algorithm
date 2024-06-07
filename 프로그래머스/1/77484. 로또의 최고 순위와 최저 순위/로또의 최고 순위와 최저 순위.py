def solution(lottos, win_nums):
    # 맞힌 개수 : 등수
    rank_dict = {0:6, 1:6, 2:5, 3:4, 4:3, 5:2, 6:1}
    min_count = 0
    for i in lottos:
        if i in win_nums:
            min_count += 1
    max_count = min_count + lottos.count(0)
    answer = [rank_dict[max_count], rank_dict[min_count]]
    return answer
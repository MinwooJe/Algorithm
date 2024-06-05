def solution(lottos, win_nums):
    min_count, max_count = 0, 0
    rank_dict = {6:1, 5:2, 4:3, 3:4 , 2:5, 1:6, 0:6}    # 맞춘 개수 : 등수
    
    for i in lottos:
        if i in win_nums:
            min_count += 1
    max_count = min_count
    max_count += lottos.count(0)
    print(max_count, min_count)
    answer = [rank_dict[max_count], rank_dict[min_count]]

    return answer
def solution(N, stages):
    remain_count = {x:0 for x in range(1, N+2)}
    fail_rate = {x:0 for x in range(1, N+1)}
    
    # 각 스테이지에 머물러 있는 플레이어 수 계산
    for stage in stages:
        remain_count[stage] += 1
        
    total = len(stages)
    
    for i in range(1, N+1):
        if total != 0:
            fail_rate[i] = remain_count[i] / total
            total -= remain_count[i]
        else:
            fail_rate[i] = 0
    
    answer_dict = dict(sorted(fail_rate.items(), key=lambda item:item[1], reverse=True))

    answer = [stage for stage in answer_dict.keys()]
    return answer
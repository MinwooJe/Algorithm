def solution(N, stages):
    reached = len(stages)   # 해당 스테이지에 도달한 사람(분모)
    fail_rates = {}
    
    for stage in range(1, N+1):
        challenger = stages.count(stage)    # 해당 스테이지에 도전 중인 사람(분자)
        if reached == 0:        # 해당 스테이지에 도달한 사람이 없을 경우
            fail_rates[stage] = 0
        else:
            fail_rates[stage] = challenger / reached
            reached -= challenger

    answer = sorted(fail_rates, key=lambda x: fail_rates[x], reverse=True)
    return answer
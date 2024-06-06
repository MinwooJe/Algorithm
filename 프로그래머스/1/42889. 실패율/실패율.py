def solution(N, stages):
    answer = 0
    challenger = [0] * (N+1)    # 분자
    fail_rates = {}
    
    for i in range(1, N+2):
        challenger[i-1] = stages.count(i)
    #
    print(challenger)
    #
    reached = len(stages)
    for i in range(len(challenger)-1):
        if challenger[i] == 0:
            fail_rate = 0
        else:
            fail_rate = challenger[i] / reached
            reached -= challenger[i]
        fail_rates[i+1] = fail_rate
    
    answer = dict(sorted(fail_rates.items(), key=lambda x: x[1], reverse=True))
    answer = [stage for stage in answer.keys()]
    return answer
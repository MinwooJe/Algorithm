def solution(N, stages):
    reacher = len(stages)
    fail_rate_dict = {}
    for i in range(1, N+1):
        challenger = stages.count(i)
        if reacher == 0:
            fail_rate = 0
        else:
            fail_rate = challenger / reacher
        reacher -= challenger
        fail_rate_dict[i] = fail_rate
    
    answer = sorted(fail_rate_dict, key=lambda x: fail_rate_dict[x], reverse=True)
    return answer
        
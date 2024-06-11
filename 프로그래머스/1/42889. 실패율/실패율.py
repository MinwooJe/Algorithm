def solution(N, stages):
    challengers = {}
    fail_hash = {}
    for i in range(1, N+2):
        challengers[i] = stages.count(i)
    
    reached_count = len(stages)
    for i in range(1, N+1):
        if reached_count > 0:
            fail_rate = challengers[i] / reached_count
        else:
            fail_rate = 0
        fail_hash[i] = fail_rate
        reached_count -= challengers[i]
    answer = sorted(fail_hash, key=lambda x: fail_hash[x], reverse=True)
    return answer
def solution(participant, completion):
    completion_hash = {}

    for i in completion:
        if i in completion_hash:
            completion_hash[i] += 1
        else:
            completion_hash[i] = 1
    
    for i in participant:
        if i in completion_hash:
            completion_hash[i] -= 1
        
        if i not in completion_hash or completion_hash[i] < 0:
            return i
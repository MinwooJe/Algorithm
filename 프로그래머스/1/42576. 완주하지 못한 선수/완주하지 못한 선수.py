def solution(participant, completion):
    par_hash = {}
    com_hash = {}
    
    for i in completion:
        if i in com_hash:
            com_hash[i] += 1
        else:
            com_hash[i] = 1

    for i in participant:
        if i not in com_hash:
            return i
        com_hash[i] -= 1
        if com_hash[i] < 0:
            return i
            
    
    
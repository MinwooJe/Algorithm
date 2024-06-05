def solution(participant, completion):
    com_hash = {}
    par_hash = {}
    
    for i in completion:
        if i in com_hash:
            com_hash[i] += 1
        else:
            com_hash[i] = 1
    
    for i in participant:
        if i in par_hash:
            par_hash[i] += 1
        else:
            par_hash[i] = 1
    # print(par_hash, com_hash)
    for i in par_hash.keys():
        if i not in com_hash:
            return i
        if par_hash[i] != com_hash[i]:
            return i
def solution(participant, completion):
    completionDict = {}
    
    for c in completion:
        if c not in completionDict:
            completionDict[c] = 1
        else:
            completionDict[c] += 1

    for p in participant:
        if p not in completionDict:
            return p
        elif completionDict[p] == 0:
            return p
        else:
            completionDict[p] -= 1
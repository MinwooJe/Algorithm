def solution(participant, completion):
    completionDict = {}
    
    for player in completion:
        if player in completionDict:
            completionDict[player] += 1
        else:
            completionDict[player] = 1

    for player in participant:
        if player not in completionDict or completionDict[player] == 0:
            return player
        
        completionDict[player] -= 1

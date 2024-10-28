def solution(participant, completion):
    participant_dic = {}
    for p in participant:
        if p in participant_dic:
            participant_dic[p] += 1
        else:
            participant_dic[p] = 1
    
    for c in completion:
        participant_dic[c] -= 1
    
    for p in participant_dic.keys():
        if participant_dic[p] > 0:
            return p
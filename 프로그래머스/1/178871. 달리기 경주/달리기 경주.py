def solution(players, callings):
    
    calling_dict = {p:idx for idx, p in enumerate(players)}

    for p in callings:
        idx = calling_dict[p]
        # idx = players.index(p)    -> 인덱스 찾는데 n, for 문 n => n^2

        players[idx-1], players[idx] = players[idx], players[idx-1]
        
        calling_dict[players[idx]] += 1
        calling_dict[players[idx-1]] -= 1
    return players
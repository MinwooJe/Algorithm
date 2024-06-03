def solution(players, callings):
    rank_hash = {p:i for i, p in enumerate(players)}
    
    for p in callings:
        idx = rank_hash[p]
        
        players[idx], players[idx-1] = players[idx-1], players[idx]
        rank_hash[players[idx]] += 1
        rank_hash[players[idx-1]] -= 1
    
    return players
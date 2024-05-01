def solution(players, callings):
    # 인덱스를 저장하는 딕셔너리
    players_dict = {player: idx for idx, player in enumerate(players)}
    
    for p in callings:
        idx = players_dict[p]   # 불린 선수의 순위
        
        # 원래 리스트에서 위치 변경
        players[idx], players[idx-1] = players[idx-1], players[idx]
        
        # 딕셔너리에서 선수들의 인덱스(순위) 변경
        players_dict[players[idx]] += 1     # 추월당한 선수의 순위를 원래 순위에서 +1
        players_dict[players[idx-1]] -= 1 # 추월한 선수의 순위를 원래 순위에서 -1
    return players

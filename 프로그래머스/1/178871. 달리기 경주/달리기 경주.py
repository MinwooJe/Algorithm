def solution(players, callings):
    grade_hash = {p:idx for idx, p in enumerate(players)}
    
    for p in callings:
        # 추월한사람의 players에서의 인덱스 저장 - grade_hash 이용 -> O(1)
        idx = grade_hash[p]
        # players 스왑
        players[idx-1], players[idx] = players[idx], players[idx-1]
        # grade_hash 순위 갱신
        grade_hash[p] -= 1
        grade_hash[players[idx]] += 1
    
    return players
        
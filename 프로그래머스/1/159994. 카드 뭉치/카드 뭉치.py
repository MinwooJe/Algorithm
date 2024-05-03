def solution(cards1, cards2, goal):
    cards1_idx = 0
    cards2_idx = 0
    answer = 'Yes'
    
    for s in goal:
        if cards1_idx < len(cards1) and s == cards1[cards1_idx]:
            cards1_idx += 1
        elif cards2_idx < len(cards2) and s == cards2[cards2_idx]:
            cards2_idx += 1
        else:
            answer = 'No'
            break
    return answer
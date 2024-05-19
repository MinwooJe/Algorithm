def solution(cards1, cards2, goal):
    answer = 'Yes'
    p1, p2 = 0, 0   # cards1,2의 각 인덱스를 가리키는 포인터
    
    for i in range(len(goal)):
        if p1 < len(cards1) and cards1[p1] == goal[i]:
            p1 += 1
        elif p2 < len(cards2) and cards2[p2] == goal[i]:
            p2 += 1
        else:
            answer = 'No'
            break
    return answer
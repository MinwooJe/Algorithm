def solution(friends, gifts):
    length = len(friends)
    table = [[0 for _ in range(len(friends))] for _ in range(length)]
    name_dict = {name:idx for idx, name in enumerate(friends)}

    # index_dict = {이름: [준 선물 개수, 받은 선물 개수]} => 선물지수 계산용
    index_dict = {idx:[0, 0] for idx in range(length)}
    gift_index = [0 for _ in range(length)]
    
    next_month = [0 for _ in range(length)]
    
    # 주고받은 선물의 개수를 표현하는 테이블 만들기
    for gift in gifts:
        giver, taker = gift.split()
        giver, taker = name_dict[giver], name_dict[taker]

        table[giver][taker] += 1        # 테이블 게산
    
        # 선물지수 계산하기 위한 딕셔너리 만들기
        index_dict[giver][0] += 1
        index_dict[taker][1] += 1
        
    # 선물지수 리스트 계산
    for i in range(length):
        gift_index[i] = index_dict[i][0] - index_dict[i][1]

    # 다음 달 받을 선물 개수 계산
    for i in range(length):
        for j in range(i, length):
            if i != j:
                if table[i][j] > table[j][i]:
                    next_month[i] += 1
                elif table[i][j] < table[j][i]:
                    next_month[j] += 1
                else:
                    if gift_index[i] > gift_index[j]:
                        next_month[i] += 1
                    elif gift_index[i] < gift_index[j]:
                        next_month[j] += 1

    return max(next_month)
def solution(friends, gifts):
    n_friends = len(friends)
    friends_dict =  {v:idx for idx, v in enumerate(friends)}
    table = [[0 for _ in range(n_friends)] for _ in range(n_friends)]
    next_month_count = [0 for _ in range(n_friends)]
    gift_index  = [0 for _ in range(n_friends)]
    
    # 주고 받은 개수 테이블 만들기
    for idx, gift in enumerate(gifts):
        giver, taker = gift.split()
        table[friends_dict[giver]][friends_dict[taker]] += 1
        gifts[idx] = [friends_dict[giver], friends_dict[taker]]
    
    # 선물 지수 계산
    for i in range(n_friends):
        gift_index[i] += sum(table[i])
        for j in range(n_friends):
            gift_index[i] -= table[j][i]
    print(f'선물 지수 : {gift_index}')
    for i in range(n_friends):
        for j in range(i, n_friends):
            if i != j:
                if table[i][j] > table[j][i]:	# i->j > j->i 일때
                    next_month_count[i] += 1
                elif table[i][j] < table[j][i]:	# j->i > i->j 일때
                    next_month_count[j] += 1
                else:
                    # 선물 지수 비교
                    if gift_index[i] > gift_index[j]:
                    	next_month_count[i] += 1
                    elif gift_index[i] < gift_index[j]:
                    	next_month_count[j] += 1
	
    answer = max(next_month_count)
    
    return answer
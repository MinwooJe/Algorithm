def solution(bandage, health, attacks):
    answer = 0
    hp = health
    end_time = attacks[-1][0]
    
    for i in range(len(attacks)):
        # 공격 당함
        hp -= attacks[i][1]
        print(f'공격받은 직후 : {hp}')
        
        # 사망 시 끝
        if hp <= 0:
            return -1
        
        # 다음 공격까지 남은 시간 구하기
        if i < len(attacks)-1:
            cooltime = attacks[i+1][0] - attacks[i][0] - 1
        else:
            break

        # 회복
        count = 0
        for _ in range(cooltime):
            count += 1
            hp += bandage[1]
            if count % bandage[0] == 0:
                print('추가 획득')
                hp += bandage[2]
            if hp > health:
                hp = health
            print('회복 후 : ', hp)
        count = 0
    answer = hp
    return answer
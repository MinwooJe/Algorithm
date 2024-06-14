def solution(bandage, health, attacks):
    hp = health
    for idx, atk in enumerate(attacks):        
        # 공격 당함
        dmg = atk[1]
        hp -= dmg
        print('공격 직후: ', hp)
        if hp <= 0:
            return -1
        
        # 다음 공격 전까지의 시간 구하기
        if idx + 1 < len(attacks): # 마지막 인덱스 직전까지
            cooltime = attacks[idx+1][0] - attacks[idx][0]
            # 회복
            count = 0
            for i in range(cooltime-1):
                count += 1
                hp += bandage[1]
                if count == bandage[0]:
                    hp += bandage[2]
                    count = 0
                if hp > health:
                    hp = health
                print(count, '회복 완료 후: ', hp)
    
    return hp
            
def solution(bandage, health, attacks):
    (t, x, y) = (bandage[0], bandage[1], bandage[2])
    lastTime = 0
    currHealth = health
    
    for attack in attacks:
        # 1. 연속 성공시간 구하기
        successTime = attack[0] - lastTime - 1
        lastTime = attack[0]
        
        # 2. 총 회복 체력 구하고, 회복 시키기
        if successTime >= t:
            additionalHP = successTime * x + y * (successTime // t)
        else:
            additionalHP = successTime * x
            
        if currHealth + additionalHP > health:
            currHealth = health
        else:
            currHealth += additionalHP
        
        # 3. 몬스터 공격 받고 죽는지 사는지 판단하기
        if currHealth - attack[1] <= 0:
            return -1
        else:
            currHealth -= attack[1]
        print(currHealth, additionalHP)
    return currHealth
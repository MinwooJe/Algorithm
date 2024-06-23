def solution(fees, records):
    answer = []
    record_hash = {}
    fee_hash = {}   # {차량번호: [주차시간, 요금]}
    
    # 1. 총 주차 시간 계산
        # record_hash = {차량번호 : [시간, 플래그]} 만들기.
    for r in records:
        time, num, flag = r.split()
        h, m = time.split(':')
        h, m = int(h), int(m)
        time = h*60 + m     # 입차시간
        
        # 입차: 입차시간 record_hash 저장 -> fee_hash 초기화
        if num not in record_hash:
            record_hash[num] = [time, flag]
            fee_hash[num] = [0, fees[1]]
        # 출차: 주차 시간 계산 -> fee_hash 저장 -> record_hash flag 변경
        elif flag == "OUT":    
            park_time = time - record_hash[num][0]
            fee_hash[num][0] += park_time
            record_hash[num][1] = flag
        # 재입차: 입차 시간 record_hash 저장 -> record_hash flag 변경
        elif flag == "IN":      # 입차
            record_hash[num][0] = time
            record_hash[num][1] = flag

    # 2. 입차 후 출차 안한 차 확인
    for num in record_hash.keys():
        if record_hash[num][1] == "IN":
            fee_hash[num][0] += 1439 - record_hash[num][0]
    
    # 3. 가격 계산
        # fee_hash 순회 -> ((총 주차시간-기본시간-1) // 단위 시간 + 1) * 단위 요금

    for num in fee_hash.keys():
        park_time = fee_hash[num][0] - fees[0]
        if park_time <= 0:
            continue
        else:
            t = ((park_time - 1) // fees[2] + 1)
            fee_hash[num][1] +=  t * fees[3]
    
    fee_hash = sorted(fee_hash.items(), key=lambda x: x[0])
    answer = [car[1][1] for car in fee_hash]
    return answer
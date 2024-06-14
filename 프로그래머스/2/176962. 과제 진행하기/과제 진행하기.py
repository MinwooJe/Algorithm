def solution(plans):
    plans = sorted(plans, key=lambda x: x[1])
    answer = []
    stack = []
    
    # 시간 변환
    for i in range(len(plans)):
        h, m = plans[i][1].split(':')
        plans[i][1] = int(h) * 60 + int(m)
        plans[i][2] = int(plans[i][2])
    
    for idx, plan in enumerate(plans):
        stack.append(plan)
        # 다음 과제까지 남은 시간 구하기
        if idx + 1 < len(plans):
            delta = plans[idx+1][1] - plans[idx][1]
        
            # 소요시간 - delta -> 만약 delta가 엄청 커서 여러 과제들 수ㅐㅎㅇ 가능하다면?
            while stack and delta >= stack[-1][2]:
                delta -= stack[-1][2]
                answer.append(stack.pop()[0])
            if stack:
                stack[-1][2] -= delta

    while stack:
        answer.append(stack.pop()[0])
    
    return answer
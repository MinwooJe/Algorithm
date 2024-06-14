def solution(plans):
    plans = sorted(plans, key=lambda x: x[1])
    stack = []
    answer = []
    
    # 시간 분으로 바꾸기 ex) 03:30 -> 210
    for i in range(len(plans)):
        h, m = map(int, plans[i][1].split(':'))
        plans[i][1] = h*60 + m
        plans[i][2] = int(plans[i][2])

    for idx, plan in enumerate(plans):
        stack.append(plan)
        # 다음 과제와 시간 차 구하기 - 스택에 들어올 때
        if idx+1 < len(plans):
            delta = plans[idx+1][1] - plans[idx][1]
            # 소요시간을 시간차만큼 빼기  - 시간차가 한과목 끝내고도 남는 경우 처리
            while stack and stack[-1][2] <= delta:
                delta -= stack[-1][2]
                answer.append(stack.pop()[0])
            if stack:
                stack[-1][2] -= delta
                
    # 모든 과제가 다 들어왔을 때
    while stack:
        answer.append(stack.pop()[0])
    
    return answer
def solution(id_list, report, k):
    answer = []
    report = list(set(report))
    report_count = {user:0 for user in id_list}
    report_dict = {user:[] for user in id_list}

    # 신고 정보 집계
    for rep in report:
        user, trol = rep.split()
        # 신고 당한 누적 횟수 세기
        if trol in report_count:
            report_count[trol] += 1
        else:
            report_count[trol] = 1
        # 신고자의 신고 내용 저장
        report_dict[user].append(trol)
    
    # 메일 결과 계산
    for user, trol in report_dict.items():
        count = 0
        for t in trol:
            if report_count[t] >= k:
                count += 1
        answer.append(count)
    
    return answer
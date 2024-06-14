def solution(id_list, report, k):
    reported_count = {user:0 for user in id_list}
    report_to = {trol:[] for trol in id_list}   # 신고 당한 사람: [신고자1, 신고자2,..]
    mail_count = [0]  * len(id_list)
    report = set(report)
    
    # 신고한 사람 카운팅 + report_to 딕셔너리 완성
    for r in report:
        user, trol = r.split()
        reported_count[trol] += 1
        report_to[trol].append(user)
    
    # 정지당한 이용자 찾고 mail_count 갱신
    for trol, count in reported_count.items():
        if count >= k:
            for user in report_to[trol]:
                mail_count[id_list.index(user)] += 1
    
    return mail_count
def solution(record):
    answer = []
    user_dic = {}
    action_dic = {'Enter':'들어왔습니다.', 'Leave': '나갔습니다..'}

    for r in record:
        head = r.split()[0]
        uid = r.split()[1]
        
        # Enter, Change 경우 모두 처리(Create, Update)
        if head != 'Leave':
            nickname = r.split()[2]
            user_dic[uid] = nickname
            
    for r in record:
        head = r.split()[0]
        uid = r.split()[1]
        
        if r.split()[0] == 'Enter':
            nickname = r.split()[2]
            answer.append(f'{user_dic[uid]}님이 들어왔습니다.')
        elif r.split()[0] == 'Leave':
            answer.append(f'{user_dic[uid]}님이 나갔습니다.')
        

    return answer

["Prodo님이 들어왔습니다.","Ryan님이 들어왔습니다.","Prodo님이 나갔습니다.","Prodo님이 들어왔습니다.","Ryan님이 나갔습니다."]
["Prodo님이 들어왔습니다.","Ryan님이 들어왔습니다.","Prodo님이 나갔습니다.","Prodo님이 들어왔습니다."]
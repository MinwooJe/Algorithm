def solution(s):
    answer = [0, 0]
    s_hash = {'0':s.count('0'), '1':s.count('1')}
    
    while s != '1':
        answer[0] += 1
        if s_hash['0'] > 0:     # 0 제거 필요하다면
            # 0 제거
            answer[1] += s_hash['0']
            s_hash['0'] = 0
            s = '1'*s_hash['1']
            
        # 이진법으로 변환
        len_s = len(s)
        s = str(bin(len_s)[2:])
        s_hash = {'0':s.count('0'), '1':s.count('1')}
            
        print(s)
    return answer
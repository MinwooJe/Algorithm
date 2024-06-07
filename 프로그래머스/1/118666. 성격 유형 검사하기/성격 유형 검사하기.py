def solution(survey, choices):
    answer = ''
    per_dict = {'R':0, 'T':0, 'C':0, 'F':0,'J':0, 'M':0,'A':0, 'N':0}
    
    # 점수 합산
    for s, c in zip(survey, choices):
        if c in [1, 2, 3]:  # 비동의
            per_dict[s[0]] += 4-c
        elif c in [5, 6, 7]:
            per_dict[s[1]] += c-4
        else:
            continue

    # 결과 도출
    if per_dict['R'] >= per_dict['T']:
        answer += 'R'
    else:
        answer += 'T'
        
    if per_dict['C'] >= per_dict['F']:
        answer += 'C'
    else:
        answer += 'F'
        
    if per_dict['J'] >= per_dict['M']:
        answer += 'J'
    else:
        answer += 'M'
    
    if per_dict['A'] >= per_dict['N']:
        answer += 'A'
    else:
        answer += 'N'

    return answer
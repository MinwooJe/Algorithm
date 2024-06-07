def solution(new_id):
    answer = ''
    temp = ''
    # 1st)
    answer = new_id.lower()
    
    # 2nd)
    for i in answer:
        if i.isalpha() or i.isdigit() or i in ['-', '_', '.']:
            temp += i
    answer = temp
    
    # 3rd)
    while '..' in answer:
        answer = answer.replace('..', '.')

    # 4th)
    answer = list(answer)
    if answer[0] == '.':
        answer.pop(0)
    if answer[-1:] == ['.']:
        answer.pop(-1)
        
    # 5th)
    if not answer:
        answer += 'a'
    
    # 6th)
    if len(answer) >= 16:
        answer = answer[:15]
    if answer[-1] == '.':
        answer = answer[:-1]
    
    # 7th)
    if len(answer) > 0 or len(answer) <= 2:
        padded_char = answer[-1]
        while len(answer) < 3:
            answer += padded_char
    answer = ''.join(answer)
    return answer
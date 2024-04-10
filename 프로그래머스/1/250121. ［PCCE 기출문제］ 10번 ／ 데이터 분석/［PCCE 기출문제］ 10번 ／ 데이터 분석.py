def get_value(s):
    if s == 'code':
        return 0
    elif s == 'date':
        return 1
    elif s == 'maximum':
        return 2
    else:
        return 3

def solution(data, ext, val_ext, sort_by):
    answer = []
    max = 0
    
    for arr in data:
        if arr[get_value(ext)] < val_ext:
            answer.append(arr)
    
    
    criteria = get_value(sort_by)
    for n in range(len(answer) - 1, 0, -1):
        for i in range(n):
            if answer[i][criteria] > answer[i + 1][criteria]:
                temp = answer[i]
                answer[i] = answer[i+1]
                answer[i+1] = temp            
    
    return answer
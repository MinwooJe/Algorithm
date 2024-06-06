def solution(numbers, hand):
    answer = ''
    if hand == 'right':
        hand = 'R'
    else:
        hand = 'L'
    loc_l, loc_r = [3, 0], [3, 2]
    
    for i in numbers:
        if i in [1, 4, 7]:
            answer += 'L'
        elif i in [3, 6, 9]:
            answer += 'R'
        else:
            loc_i = find_location(i)
            diff_l = get_distance(loc_i, loc_l)
            diff_r = get_distance(loc_i, loc_r)
            if diff_l == diff_r:
                answer += hand
            elif diff_l < diff_r:
                answer += 'L'
            else:
                answer += 'R'
        if answer[-1] == 'L':
            loc_l = find_location(i)
        else:
            loc_r = find_location(i)

    return answer

def find_location(n):
    keypad = [[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9],
          ['*', 0, '#']]
    for keys in keypad:
        if n in keys:
            row = keypad.index(keys)
            col = keys.index(n)
    return [row, col]

def get_distance(a, b):
    diff_x = abs(a[1] - b[1])
    diff_y = abs(a[0] - b[0])
    return diff_x + diff_y

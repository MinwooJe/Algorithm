def solution(numbers, hand):
    answer = ''
    l_coordinate, r_coordinate = [3, 0], [3, 2]
    
    global keypad 
    keypad = [[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9], 
              ['*', 0, '#']]
    
    for i in numbers:
        if i in [1, 4, 7]:
            answer += 'L'
        elif i in [3, 6, 9]:
            answer += 'R'
        else:
            l_distance, r_distance = get_distance(i, l_coordinate), get_distance(i, r_coordinate)
            if l_distance == r_distance:
                if hand == 'left':
                    answer += 'L'
                else:
                    answer += 'R'
            elif l_distance > r_distance:
                answer += 'R'
            else:
                answer += 'L'
                
        if answer[-1] == 'L':
            l_coordinate = get_coordinate(i)
        else:
            r_coordinate = get_coordinate(i)
    
    return answer
                
def get_coordinate(n):
    coord = []
    for n_col, key_col in enumerate(keypad):
        if n in key_col:
            coord.append(n_col)
            coord.append(key_col.index(n))
    return coord

def get_distance(n, coordinate):
    n_coord = get_coordinate(n)
    distance = abs(n_coord[0] - coordinate[0]) + abs(n_coord[1] - coordinate[1])
    return distance

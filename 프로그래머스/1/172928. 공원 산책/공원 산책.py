def solution(park, routes):
    # 시작지점 찾기
    park_height, park_width = len(park), len(park[0])
    starting_point = []
    for n_row, row in enumerate(park):
        for n_col, col in enumerate(row):
            if col == 'S':
                starting_point = [n_row, n_col]
    
    temp_loc = starting_point   # 임시 위치를 나타내는 포인터

    for route in routes:
        before_loc = temp_loc[:]
        op, n = route.split()
        n = int(n)
        for i in range(n):
            temp_loc = move(temp_loc, op)   # 해당 방향으로 한 칸 이동
            print(temp_loc)
            if (temp_loc[0] < 0 or temp_loc[0] >= park_height 
            or temp_loc[1] < 0 or temp_loc[1] >= park_width
            or park[temp_loc[0]][temp_loc[1]] == 'X'):
                temp_loc = before_loc
                break
            else:
                starting_point = temp_loc
        print('op 후 위치 : ', temp_loc)
        print('===') 
    return temp_loc

def move(location, op):
    if op == 'E':
        location[1] += 1
    elif op == 'W':
        location[1] -= 1
    elif op == 'S':
        location[0] += 1
    elif op == 'N':
        location[0] -= 1
    
    return location

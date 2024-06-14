def solution(park, routes):
    # 시작 위치 찾기
    start = []
    for row_n, row in enumerate(park):
        if 'S' in row:
            col_n = row.index('S')
            start = [row_n, col_n]
    print('시작 위치 : ', start)
    for route in routes:
        op, n = route.split()
        temp_location = start[:]        # 이동했을 때의 포인터
        
        for _ in range(int(n)):
            temp_location = move(temp_location, op)
            if (temp_location[0] < 0 or temp_location[0] >= len(park)
                    or temp_location[1] < 0 or temp_location[1] >= len(park[0])
                    or park[temp_location[0]][temp_location[1]] == 'X'
                   ):
                    temp_location = start[:]
                    break
        start = temp_location[:]
            
    return start

def move(temp_location, op):
    if op == 'E':
        temp_location[1] += 1
    elif op == 'W':
        temp_location[1] -= 1
    elif op == 'S':
        temp_location[0] += 1
    else:
        temp_location[0] -= 1
    return temp_location
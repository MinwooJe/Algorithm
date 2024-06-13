def solution(park, routes):
    # 시작 지점 찾기
    for p in park:
        if 'S' in p:
            start_col = p.index('S')
            start_row = park.index(p)
    location = [start_row, start_col]
    print('시작위치:', location)

    # 이동하기
    for r in routes:
        direction, count = r.split()[0], int(r.split()[1])
        original = location[:]
        
        for _ in range(count):
            location = move(location, direction)
            if (
                location[0] < 0 or location[0] >= len(park)
                or  location[1] < 0 or location[1] >= len(park[1])
                or park[location[0]][location[1]] == 'X'
            ):
                location = original
                break
                
    return location


def move(location, direction):
    if direction == 'N':
        location[0] -= 1
    elif direction == 'S':
        location[0] += 1
    elif direction == 'W':
        location[1] -= 1
    elif direction == 'E':
        location[1] += 1

    return location
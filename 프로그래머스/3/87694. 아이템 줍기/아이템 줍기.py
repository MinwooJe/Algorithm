from collections import deque
"""
캐릭터는 다각형의 둘레를 따라 이동, 가장 바깥쪽 테두리만 이동
서로 다른 두 직사각형의 x축 좌표 or y축 좌표가 같은 경우는 없음.
-> 꼭짓점에서 만나거나 변이 겹치는 경우는 없음.
분리된 경우도 없음
그냥 무조건 bfs로 찾을수는 잇따
"""
# rectangle: 직사각형이 담긴 2차원 배열, char: 초기 위치, item: 아이템 위치
# 아이템을 줍기 위해 이동해야 하는 최단 경로 return
# rectangle[0] = [ldx, ldy, rux, ruy]
def solution(rectangle, characterX, characterY, itemX, itemY):
    board = [[-1 for _ in range(102)] for _ in range(102) ]
    answer = 0
    
    for rect in rectangle:
        ldx, ldy, rux, ruy = map(lambda x: x * 2, rect)
        for i in range(ldx, rux + 1):
            for j in range(ldy, ruy + 1):
                if ldx < i < rux and ldy < j < ruy:
                    board[i][j] = 0
                elif board[i][j] != 0:  # 다른 직사각형 내부가 아니면서, 현재 내부도 아님
                    board[i][j] = 1
    
    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]
    
    queue = deque()
    queue.append((characterX * 2, characterY * 2, 0))
    visited = [[False] * 102 for i in range(102)]
    visited[characterX * 2][characterY * 2] = 0
    
    while queue:
        x, y, distance = queue.popleft()
        if x == itemX * 2 and y == itemY * 2:
            answer = distance // 2
            break
        
        for i in range(4):
            nextX = x + dx[i]
            nextY = y + dy[i]
            
            if board[nextX][nextY] == 1 and not visited[nextX][nextY]:
                queue.append((nextX, nextY, distance + 1))
                visited[nextX][nextY] = True

    
    return answer
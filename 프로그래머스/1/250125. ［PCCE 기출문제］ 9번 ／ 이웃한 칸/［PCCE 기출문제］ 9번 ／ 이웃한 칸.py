def solution(board, h, w):
    answer = 0
    neighbor = []
    for i in range(-1, 2, 2):
        if 0 <= h + i < len(board):
            neighbor.append(board[h+i][w])
        if 0 <= w + i < len(board):
            neighbor.append(board[h][w+i])
        else:
            continue

    answer = neighbor.count(board[h][w])

    return answer
def solution(board, h, w):
    target = board[h][w]
    answer = 0
    
    for i in range(-1, 2, 2):
        if 0 <= h+i < len(board):
            if target == board[h+i][w]:
                answer += 1
        if 0 <= w+i < len(board):
            if target == board[h][w+i]:
                answer += 1
        
    return answer

def solution(board, moves):
    basket = []
    count = 0
    
    for col in moves:
        col -= 1
        row = 0
        while row < len(board)-1 and board[row][col] == 0:
            row += 1
        
        if board[row][col] != 0:
            basket.append(board[row][col])
            board[row][col] = 0
            if len(basket) > 1 and basket[-1] == basket[-2]:
                basket.pop()
                basket.pop()
                count += 2
    
    return count
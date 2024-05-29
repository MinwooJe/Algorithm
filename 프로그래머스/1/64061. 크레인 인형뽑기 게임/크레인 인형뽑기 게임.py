def solution(board, moves):
    answer = 0
    basket = []
    
    for i in moves: # 열 -> 1-based 인덱스
        for j in range(len(board)): # 행
            if board[j][i-1] != 0:
                item = board[j][i-1]
                basket.append(item)
                board[j][i-1] = 0
                if len(basket) > 1 and basket[-1] == basket[-2]:
                    basket.pop()
                    basket.pop()
                    answer += 2
                break
    return answer
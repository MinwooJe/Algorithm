def solution(board, moves):
    # 뽑은 인형들 바구니에 넝ㅎ기
    basket = []
    answer = 0

    for i in moves:
        j = 0
        while j < len(board) - 1 and board[j][i-1] == 0:   # 한 칸씩 밑으로 내려가기
            j += 1
        if board[j][i-1] != 0:             # 인형이 없는 곳에 크레인 작동시킬 경우 예외 처리
            basket.append(board[j][i-1])
            board[j][i-1] = 0
        
        if len(basket) >= 2:
            if basket[-1] == basket[-2]:
                basket.pop()
                basket.pop()
                answer += 2
    
    return answer
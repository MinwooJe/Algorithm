def solution(board, moves):
    basket = []
    count = 0
    # move의 원소-1은 board의 열을 인덱스 의미.
    # 해당 열로 가서 while 원소 == 0: 행++
    for col_idx in moves:
        col_idx -= 1
        row_idx = 0
        while row_idx < len(board)-1 and board[row_idx][col_idx] == 0:
            row_idx += 1
        
        if board[row_idx][col_idx] != 0:
            basket.append(board[row_idx][col_idx])
            board[row_idx][col_idx] = 0
        
        if len(basket) > 1:
            if basket[-1] == basket[-2]:
                basket.pop()
                basket.pop()
                count += 2
        
    return count
    # 만약 해당 열이 모두 0이라면 인덱스가 len(board)를 넘음. -> 예외처리 해주고
    # 아니면 해당 원소 스택에 넣고 board에서 0으로 바꾸기
    # 스택의 맨 마지막 두 원소가 같다면 pop 두 번
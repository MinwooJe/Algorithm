// Return: 지워진 블록이 표시된 새로운 보드, 지워진 블록의 존재 여부
func markDeletedBlock(_ board: [[String]]) -> ([[String]], Int) {
    var board = board
    var deleted = Set<[Int]>()

    for i in 0..<(board.count - 1) {
        for j in 0..<(board[0].count - 1) {
            let lu = board[i][j]
            let ld = board[i + 1][j]
            let ru = board[i][j + 1]
            let rd = board[i + 1][j + 1]
            if (lu != " ") && (lu == ld) && (ld == ru) && (ru == rd) {
                deleted.insert([i, j])
                deleted.insert([i + 1, j])
                deleted.insert([i, j + 1])
                deleted.insert([i + 1, j + 1])
            }
        }
    }
    
    for coordinate in deleted {
        let (row, col) = (coordinate[0], coordinate[1])
        board[row][col] = " "
    }

    return (board, deleted.count)
}

func reloadBoard(_ board: [[String]]) -> [[String]] {
    var board = board
    var stack = [String]()
    
    for col in 0..<board[0].count {
        // 빈칸을 제외한 아이템 모으기
        stack = []
        for row in 0..<board.count {
            if board[row][col] != " " {
                stack.append(board[row][col])
            }
        }
        
        let itemCount = stack.count
        let emptyCount = board.count - itemCount

        // 빈 칸 채우기
        for row in 0..<emptyCount {
            board[row][col] = " "
        }
        // 아이템 채우기
        for row in emptyCount..<board.count {
            board[row][col] = stack[row - emptyCount]
        }
    }

    return board
}

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var board = board.map { Array($0).map { String($0) } }
    var result = 0

    while true {
        let (markedBoard, deletedCount) = markDeletedBlock(board)
        guard deletedCount != 0 else { break }
        board = reloadBoard(markedBoard)
        
        result += deletedCount
    }

    return result
}

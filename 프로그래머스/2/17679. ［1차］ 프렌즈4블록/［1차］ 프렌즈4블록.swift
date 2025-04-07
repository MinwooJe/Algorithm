func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var board = board.map { Array($0) }
    var result = 0

    
    while true {
        let (markedBoard, deletedCount) = markBoard(board)
        guard deletedCount != 0 else { break }
        board = reloadBoard(markedBoard)
        result += deletedCount
    }

    return result
}

func markBoard(_ board: [[Character]]) -> ([[Character]], Int) {
    var board = board
    var deleted = Set<[Int]>()
    
    for row in 0..<board.count - 1 {
        for col in 0..<board[0].count - 1 {
            let lu = board[row][col]
            let ld = board[row + 1][col]
            let ru = board[row][col + 1]
            let rd = board[row + 1][col + 1]
            if lu != " " && lu == ld && ld == ru && ru == rd {
                deleted.insert([row, col])
                deleted.insert([row + 1, col])
                deleted.insert([row, col + 1])
                deleted.insert([row + 1, col + 1])
            }
        }
    }
    
    for coord in deleted {
        let (row, col) = (coord[0], coord[1])
        board[row][col] = " "
    }
    
    return (board, deleted.count)
}

func reloadBoard(_ board: [[Character]]) -> [[Character]] {
    var board = board

    for col in 0..<board[0].count {
        var stack = [Character]()
        for row in 0..<board.count {
            if board[row][col] != " " {
                stack.append(board[row][col])
            }
        }
        
        let emptyCount = board.count - stack.count
        for row in 0..<emptyCount {
            board[row][col] = " "
        }
        
        for row in emptyCount..<board.count {
            board[row][col] = stack[row - emptyCount]
        }
    }
    
    return board
}
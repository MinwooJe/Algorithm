/**
*/
// m: 행 개수, n: 열 개수
func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var result = 0
    var newBoard = board.map { Array($0) }

    while true {
        let (deletedBoard, deletedCount) = markedAndDeleted(newBoard)
        guard deletedCount != 0 else { break }
        newBoard = reloadBoard(deletedBoard)
        result += deletedCount
    }
    
    return result
}

func markedAndDeleted(_ board: [[Character]]) -> ([[Character]], Int) {
    let (m, n) = (board.count, board[0].count)
    var board = board.map { Array($0) }
    var deleted = Set<[Int]>()
    var deletedCount = 0
    
    for row in 0..<m - 1 {
        for col in 0..<n - 1 {
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
    deletedCount += deleted.count

    // 삭제
    for coord in deleted {
        let (row, col) = (coord[0], coord[1])
        board[row][col] = " "
    }
    
    return (board, deletedCount)
}

func reloadBoard(_ board: [[Character]]) -> [[Character]] {
    let (m, n) = (board.count, board[0].count)
    var board = board
    
    for col in 0..<n {
        var stack = [Character]()

        for row in 0..<m {
            if board[row][col] == " " { continue }
            stack.append(board[row][col])
        }

        let emptyCount = m - stack.count
        for row in 0..<emptyCount {
            board[row][col] = " "
        }
        for row in emptyCount..<m {
            board[row][col] = stack[row - emptyCount]
        }
    }
    
    return board
}
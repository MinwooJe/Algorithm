let boardCount = Int(readLine()!)!
let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]


var board = [[Character]]()
var blindVisited = Array(repeating: Array(repeating: false, count: boardCount), count: boardCount)
var normalVisited = Array(repeating: Array(repeating: false, count: boardCount), count: boardCount)

for _ in 0..<boardCount {
    let input = readLine()!.map { $0 }
    board.append(input)
}

var (blindResult, normalResult) = (0, 0)

for row in 0..<boardCount {
    for col in 0..<boardCount {
        if !blindVisited[row][col] {
            blindBfs(row, col)
            blindResult += 1
        }
        if !normalVisited[row][col] {
            normalBfs(row, col)
            normalResult += 1
        }
    }
}

print(normalResult, blindResult)

func blindBfs(_ row: Int, _ col: Int) {
    var queue = [(Int, Int)]()
    var queueIdx = 0
    let color = board[row][col]

    queue.append((row, col))
    blindVisited[row][col] = true
    
    while queueIdx < queue.count {
        let (curRow, curCol) = queue[queueIdx]
        queueIdx += 1

        for i in 0..<4 {
            let nextRow = curRow + dRow[i]
            let nextCol = curCol + dCol[i]
            
            guard nextRow >= 0 && nextRow < boardCount && nextCol >= 0 && nextCol < boardCount else { continue }
            
            if color == "R" || color == "G" {
                guard board[nextRow][nextCol] != "B" && !blindVisited[nextRow][nextCol] else { continue }
                queue.append((nextRow, nextCol))
                blindVisited[nextRow][nextCol] = true
            } else {
                guard board[nextRow][nextCol] == "B" && !blindVisited[nextRow][nextCol] else { continue }
                queue.append((nextRow, nextCol))
                blindVisited[nextRow][nextCol] = true
            }
            
        }
    }
}

func normalBfs(_ row: Int, _ col: Int) {
    var queue = [(Int, Int)]()
    var queueIdx = 0
    let color = board[row][col]

    queue.append((row, col))
    normalVisited[row][col] = true
    
    while queueIdx < queue.count {
        let (curRow, curCol) = queue[queueIdx]
        queueIdx += 1
        
        for i in 0..<4 {
            let nextRow = curRow + dRow[i]
            let nextCol = curCol + dCol[i]
            
            guard nextRow >= 0 && nextRow < boardCount && nextCol >= 0 && nextCol < boardCount else { continue }
            guard board[nextRow][nextCol] == color && !normalVisited[nextRow][nextCol] else { continue }
            queue.append((nextRow, nextCol))
            normalVisited[nextRow][nextCol] = true
        }
    }
}
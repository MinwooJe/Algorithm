// 서로 다른 bfs를 돌려야 하는 문제 -> 하나를 먼저 돌리자
// 불이 한 군데에서만 난다는 보장이 없음.
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (rowCount, colCount) = (input[0], input[1])
let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]

var board = [[String]]()
var fireVisited = Array(repeating: Array(repeating: -1, count: colCount), count: rowCount)
var playerVisited = Array(repeating: Array(repeating: -1, count: colCount), count: rowCount)
var fireQueue = [(Int, Int, Int)]()
var playerQueue = [(Int, Int, Int)]()

for row in 0..<rowCount {
    let input = readLine()!.map { String($0) }
    board.append(input)
    for col in 0..<colCount {
        if input[col] == "J" {
            playerQueue.append((row, col, 0))
            fireVisited[row][col] = 0
        } else if input[col] == "F" {
            fireQueue.append((row, col, 0))
            fireVisited[row][col] = 0
        }
    }
}

func fireBfs() {
    var queueIdx = 0

    while queueIdx < fireQueue.count {
        let (curRow, curCol, time) = fireQueue[queueIdx]
        queueIdx += 1
        
        for i in 0..<4 {
            let nextRow = curRow + dRow[i]
            let nextCol = curCol + dCol[i]
            
            guard nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount else { continue }
            guard board[nextRow][nextCol] != "#" && fireVisited[nextRow][nextCol] == -1 else { continue }
            fireQueue.append((nextRow, nextCol, time + 1))
            fireVisited[nextRow][nextCol] = time + 1
        }
    }
}

func playerBfs() -> Int {
    var escapeTime = -1
    var queueIdx = 0

    while queueIdx < playerQueue.count {
        let (curRow, curCol, time) = playerQueue[queueIdx]
        queueIdx += 1
        
        if curRow == 0 || curRow == rowCount - 1 || curCol == 0 || curCol == colCount - 1 {
            escapeTime = time + 1
            break
        }
        
        for i in 0..<4 {
            let nextRow = curRow + dRow[i]
            let nextCol = curCol + dCol[i]
            
            guard nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount else { continue }
            guard board[nextRow][nextCol] != "#" && playerVisited[nextRow][nextCol] == -1 else { continue }
            guard fireVisited[nextRow][nextCol] == -1 || time + 1 < fireVisited[nextRow][nextCol] else { continue }
            playerQueue.append((nextRow, nextCol, time + 1))
            playerVisited[nextRow][nextCol] = time + 1
        }
    }
    
    return escapeTime
}

fireBfs()

let escapeTime = playerBfs()

if escapeTime == -1 {
    print("IMPOSSIBLE")
} else {
    print(escapeTime)
}

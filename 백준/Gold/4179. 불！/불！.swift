/**
 지훈 탈출 기준: row == 0 || col == 0  -> 1초 뒤 탈출 성공
 지훈 bfs, 불 bfs 해야 됨.
 
 */

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (rowCount, colCount) = (input[0], input[1])
let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]

var board = [[String]]()
var fireReached = Array(repeating: Array(repeating: -1, count: colCount), count: rowCount)
var playerVisited = Array(repeating: Array(repeating: -1, count: colCount), count: rowCount)

var fireQueue = [(Int, Int, Int)]()
var playerQueue = [(Int, Int, Int)]()

for _ in 0..<rowCount {
    let input = readLine()!.map { String($0) }
    board.append(input)
}

for row in 0..<rowCount {
    for col in 0..<colCount {
        if board[row][col] == "F" {
            fireQueue.append((row, col, 0))
        } else if board[row][col] == "J" {
            playerQueue.append((row, col, 0))
        }
    }
}

// 불 bfs
var fireQueueIdx = 0
while fireQueueIdx < fireQueue.count {
    let (currRow, currCol, time) = fireQueue[fireQueueIdx]
    fireReached[currRow][currCol] = time
    fireQueueIdx += 1
    
    for i in 0..<4 {
        let nextRow = currRow + dRow[i]
        let nextCol = currCol + dCol[i]
        
        guard nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount else { continue }
        guard fireReached[nextRow][nextCol] < 0 && board[nextRow][nextCol] != "#" else { continue }
        
        fireQueue.append((nextRow, nextCol, time + 1))
        fireReached[nextRow][nextCol] = time + 1
    }
}
fireReached.forEach { $0 }

var playerQueueIdx = 0
var isSuccess = false
var escapeTime = 0
while playerQueueIdx < playerQueue.count {
    let (currRow, currCol, time) = playerQueue[playerQueueIdx]
    playerVisited[currRow][currCol] = time
    playerQueueIdx += 1
    
    if currRow == 0 || currRow == rowCount - 1 || currCol == 0 || currCol == colCount - 1 {
        isSuccess = true
        escapeTime = time + 1
        break
    }

    for i in 0..<4 {
        let nextRow = currRow + dRow[i]
        let nextCol = currCol + dCol[i]
        
        guard nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount else { continue }
        guard playerVisited[nextRow][nextCol] < 0 && board[nextRow][nextCol] != "#" else { continue }
        // 불이 고립되어 퍼지지 않는 경우에는 fireReached가 모두 -1 이라서 time + 1 < fireReached 비교는 항상 거짓이 됨.
        guard fireReached[nextRow][nextCol] == -1 || time + 1 < fireReached[nextRow][nextCol] else { continue }

        playerQueue.append((nextRow, nextCol, time + 1))
        playerVisited[nextRow][nextCol] = time + 1
    }
}

if isSuccess {
    print(escapeTime)
} else {
    print("IMPOSSIBLE")
}

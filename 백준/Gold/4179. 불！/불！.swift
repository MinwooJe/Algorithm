let input = readLine()!.split(separator: " ").map { Int($0)! }
let (rowCount, colCount) = (input[0], input[1])
let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]

var board = [[String]]()

var fireVisited = Array(repeating: Array(repeating: -1, count: colCount), count: rowCount)
var fireQueue = [(Int, Int)]()
var fireQueueIdx = 0

var playerVisited = Array(repeating: Array(repeating: -1, count: colCount), count: rowCount)
var playerQueue = [(Int, Int)]()
var playerQueueIdx = 0

for row in 0..<rowCount {
    let input = readLine()!.map { String($0) }
    board.append(input)
    
    for col in 0..<colCount {
        if input[col] == "F" {
            fireQueue.append((row, col))
            fireVisited[row][col] = 0
        } else if input[col] == "J" {
            playerQueue.append((row, col))
            playerVisited[row][col] = 0
        }
    }
}

while fireQueueIdx < fireQueue.count {
    let (curRow, curCol) = fireQueue[fireQueueIdx]
    fireQueueIdx += 1
    
    for i in 0..<4 {
        let nextRow = curRow + dRow[i]
        let nextCol = curCol + dCol[i]
        
        guard nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount else { continue }
        guard fireVisited[nextRow][nextCol] == -1 && board[nextRow][nextCol] != "#" else { continue }
        fireQueue.append((nextRow, nextCol))
        fireVisited[nextRow][nextCol] = fireVisited[curRow][curCol] + 1
    }
}


var result = -1
while playerQueueIdx < playerQueue.count {
    let (curRow, curCol) = playerQueue[playerQueueIdx]
    playerQueueIdx += 1
    
    if curRow == 0 || curRow == rowCount - 1 || curCol == 0 || curCol == colCount - 1 {
        result = playerVisited[curRow][curCol] + 1
        break
    }
    
    for i in 0..<4 {
        let nextRow = curRow + dRow[i]
        let nextCol = curCol + dCol[i]
        let nextTime = playerVisited[curRow][curCol] + 1
        
        guard nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount else { continue }
        guard playerVisited[nextRow][nextCol] == -1 && board[nextRow][nextCol] != "#" else { continue }
        guard fireVisited[nextRow][nextCol] == -1 || nextTime < fireVisited[nextRow][nextCol] else { continue }
        playerQueue.append((nextRow, nextCol))
        playerVisited[nextRow][nextCol] = nextTime
    }
}

if result == -1 {
    print("IMPOSSIBLE")
} else {
    print(result)
}

import Foundation

let inputCount = Int(readLine()!)!
let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]

var board = [[Character]]()
var fireQueue = [(Int, Int)]()
var playerQueue = [(Int, Int)]()
var fireVisited = [[Int]]()
var playerVisited = [[Int]]()

for _ in 0..<inputCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (colCount, rowCount) = (input[0], input[1])
    
    board = [[Character]]()
    fireQueue = [(Int, Int)]()
    playerQueue = [(Int, Int)]()
    fireVisited = Array(repeating: Array(repeating: -1, count: colCount), count: rowCount)
    playerVisited = Array(repeating: Array(repeating: -1, count: colCount), count: rowCount)
    
    for row in 0..<rowCount {
        let input = readLine()!.map { $0 }
        board.append(input)
        
        for col in 0..<colCount {
            if board[row][col] == "*" {
                fireQueue.append((row, col))
                fireVisited[row][col] = 0
            } else if board[row][col] == "@" {
                playerQueue.append((row, col))
                playerVisited[row][col] = 0
            }
        }
    }
    
    fireBfs(rowCount, colCount)
    let escapeTime = playerBfs(rowCount, colCount)

    
    if escapeTime == -1 {
        print("IMPOSSIBLE")
    } else {
        print(escapeTime)
    }
}

func fireBfs(_ rowCount: Int, _ colCount: Int) {
    var queueIdx = 0
    
    while queueIdx < fireQueue.count {
        let (curRow, curCol) = fireQueue[queueIdx]
        queueIdx += 1
        
        for i in 0..<4 {
            let nextRow = curRow + dRow[i]
            let nextCol = curCol + dCol[i]
            
            guard nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount else { continue }
            guard board[nextRow][nextCol] != "#" && fireVisited[nextRow][nextCol] == -1 else { continue }
            
            fireQueue.append((nextRow, nextCol))
            fireVisited[nextRow][nextCol] = fireVisited[curRow][curCol] + 1
        }
    }
}

func playerBfs(_ rowCount: Int, _ colCount: Int) -> Int {
    var escapeTime = -1
    var queueIdx = 0
    
    while queueIdx < playerQueue.count {
        let (curRow, curCol) = playerQueue[queueIdx]
        let curTime = playerVisited[curRow][curCol]
        queueIdx += 1
        
        if curRow == 0 || curRow == rowCount - 1 || curCol == 0 || curCol == colCount - 1 {
            escapeTime = curTime + 1
            return escapeTime
        }
        
        for i in 0..<4 {
            let nextRow = curRow + dRow[i]
            let nextCol = curCol + dCol[i]
            
            guard nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount else { continue }
            guard board[nextRow][nextCol] != "#" && playerVisited[nextRow][nextCol] == -1 else { continue }
            guard fireVisited[nextRow][nextCol] == -1 || curTime + 1 < fireVisited[nextRow][nextCol] else { continue }
            
            playerQueue.append((nextRow, nextCol))
            playerVisited[nextRow][nextCol] = curTime + 1
        }
    }
    
    return escapeTime
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (rowCount, colCount, rectCount) = (input[0], input[1], input[2])
let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]

var board = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
var dist = Array(repeating: Array(repeating: -1, count: colCount), count: rowCount)
var totalSize = [Int]()
var totalCount = 0

for _ in 0..<rectCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (ldx, ldy, rux, ruy) = (input[0], input[1], input[2], input[3])
    let (rowMin, rowMax) = (rowCount - ruy, rowCount - ldy - 1)
    let (colMin, colMax) = (ldx, rux - 1)
    
    for row in rowMin...rowMax {
        for col in colMin...colMax {
            board[row][col] = 1
        }
    }
}

for row in 0..<rowCount {
    for col in 0..<colCount {
        if dist[row][col] == -1 && board[row][col] == 0 {
            let size = bfs(row, col)
            totalSize.append(size)
            totalCount += 1
        }
    }
}

func bfs(_ row: Int, _ col: Int) -> Int {
    var size = 1
    var queue = [(Int, Int)]()
    var queueIdx = 0
    
    queue.append((row, col))
    dist[row][col] = 1
    
    while queueIdx < queue.count {
        let (curRow, curCol) = queue[queueIdx]
        queueIdx += 1
        
        for i in 0..<4 {
            let nextRow = curRow + dRow[i]
            let nextCol = curCol + dCol[i]
            
            guard nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount else { continue }
            guard dist[nextRow][nextCol] == -1 && board[nextRow][nextCol] == 0 else { continue }
            queue.append((nextRow, nextCol))
            dist[nextRow][nextCol] = dist[curRow][curCol] + 1
            size += 1
        }
    }

    return size
}

print(totalCount)
totalSize.sorted().forEach { print($0, terminator: " ")}

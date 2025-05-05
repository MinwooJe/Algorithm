let inputCount = Int(readLine()!)!
let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]

for _ in 0..<inputCount {
    /**
     board, visited, queue
     board: 0으로 초기화, 배추 들어온건 1로 초기화
     visited: [[Bool]]
     
     colCount, rowCount, cabbageCount
     */
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (colCount, rowCount, cabbageCount) = (input[0], input[1], input[2])
    var board = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    
    for _ in 0..<cabbageCount {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (col, row) = (input[0], input[1])
        board[row][col] = 1
    }
    
    let result = getCabbageCount(rowCount, colCount, board)
    print(result)
}

func getCabbageCount(_ rowCount: Int, _ colCount: Int, _ board: [[Int]]) -> Int {
    var earthwormCount = 0
    var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)

    for row in 0..<rowCount {
        for col in 0..<colCount {
            guard !visited[row][col] && board[row][col] == 1 else { continue }
            
            bfs(row, col)
            earthwormCount += 1
        }
    }
    
    func bfs(_ row: Int, _ col: Int) {
        var queue = [(Int, Int)]()
        var queueIdx = 0
        
        queue.append((row, col))
        
        while queueIdx < queue.count {
            let (curRow, curCol) = queue[queueIdx]
            queueIdx += 1
            
            for i in 0..<4 {
                let nextRow = curRow + dRow[i]
                let nextCol = curCol + dCol[i]
                
                guard nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount else { continue }
                guard board[nextRow][nextCol] == 1 && !visited[nextRow][nextCol] else { continue }
                
                queue.append((nextRow, nextCol))
                visited[nextRow][nextCol] = true
            }
        }
    }

    return earthwormCount
}

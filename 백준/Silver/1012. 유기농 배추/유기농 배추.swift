let tcCount = Int(readLine()!)!
let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]

for _ in 0..<tcCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (colCount, rowCount, cabbageCount) = (input[0], input[1], input[2])
    
    var board = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
    var earthwormCount = 0

    for _ in 0..<cabbageCount {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (col, row) = (input[0], input[1])
        board[row][col] = 1
    }
    
    for row in 0..<rowCount {
        for col in 0..<colCount {
            guard !visited[row][col] && board[row][col] == 1 else { continue }
            bfs(row, col)
            earthwormCount += 1
        }
    }
    
    print(earthwormCount)
    
    func bfs(_ row: Int, _ col: Int) {
        var queue = [(Int, Int)]()
        var queueIdx = 0
        
        queue.append((row, col))
        visited[row][col] = true
        
        while queueIdx < queue.count {
            let (curRow, curCol) = queue[queueIdx]
            queueIdx += 1

            for i in 0..<4 {
                let nextRow = curRow + dRow[i]
                let nextCol = curCol + dCol[i]
                
                guard nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount else { continue }
                guard !visited[nextRow][nextCol] && board[nextRow][nextCol] == 1 else { continue }
                queue.append((nextRow, nextCol))
                visited[nextRow][nextCol] = true
            }
        }
    }
}

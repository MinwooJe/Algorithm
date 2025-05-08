let boardLen = Int(readLine()!)!
let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]

var board = [[Character]]()

for _ in 0..<boardLen {
    let input = readLine()!.map { $0 }
    board.append(input)
}

let normalCount = getArea()

for row in 0..<boardLen {
    for col in 0..<boardLen {
        if board[row][col] == "R" {
            board[row][col] = "G"
        }
    }
}

let blindCount = getArea()

print(normalCount, blindCount)

func getArea() -> Int {
    var visited = Array(repeating: Array(repeating: false, count: boardLen), count: boardLen)
    var area = 0

    for row in 0..<boardLen {
        for col in 0..<boardLen {
            guard !visited[row][col] else { continue }
            bfs(row, col)
            area += 1
        }
    }
    
    func bfs(_ row: Int, _ col: Int) {
        let curColor = board[row][col]
        
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
                
                guard nextRow >= 0 && nextRow < boardLen && nextCol >= 0 && nextCol < boardLen else { continue }
                guard !visited[nextRow][nextCol] && board[nextRow][nextCol] == curColor else { continue }
                queue.append((nextRow, nextCol))
                visited[nextRow][nextCol] = true
            }
        }
    }
    
    return area
}

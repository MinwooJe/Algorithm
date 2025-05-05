let boardLength = Int(readLine()!)!
let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]

var board = [[Character]]()
var visited = Array(repeating: Array(repeating: false, count: boardLength), count: boardLength)

for _ in 0..<boardLength {
    let input = readLine()!.map { $0 }
    board.append(input)
}

func getArea(_ board: [[Character]]) -> Int {
    var areaCount = 0
    visited = Array(repeating: Array(repeating: false, count: boardLength), count: boardLength)
    for row in 0..<boardLength {
        for col in 0..<boardLength {
            // 방문안했으면 bfs 호출. bfs에서 색 판단
            guard !visited[row][col] else { continue }
            bfs(row, col)
            areaCount += 1
        }
    }
    
    return areaCount
}

func bfs(_ row: Int, _ col: Int) {
    let color = board[row][col]
    
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
            
            guard nextRow >= 0 && nextRow < boardLength && nextCol >= 0 && nextCol < boardLength else { continue }
            guard !visited[nextRow][nextCol] && board[nextRow][nextCol] == color else { continue }
            
            queue.append((nextRow, nextCol))
            visited[nextRow][nextCol] = true
        }
    }
}

func main() {
    let normalCount = getArea(board)
    
    for row in 0..<boardLength {
        for col in 0..<boardLength {
            if board[row][col] == "G" {
                board[row][col] = "R"
            }
        }
    }
    
    let colorBlindCount = getArea(board)
    
    print(normalCount, colorBlindCount)
}

main()

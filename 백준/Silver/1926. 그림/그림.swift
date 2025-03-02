let input = readLine()!.split(separator: " ").map { Int($0)! }
let (rowCount, colCount) = (input[0], input[1])
var board = [[Int]]()

for _ in 0..<rowCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(input)
}

var count = 0
var maxSize = 0
var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]

for row in 0..<rowCount {
    for col in 0..<colCount {
        if board[row][col] == 1 && !visited[row][col] {
            let size = bfs(row, col)
            count += 1
            maxSize = max(size, maxSize)
        }
    }
}

func bfs(_ row: Int, _ col: Int) -> Int {
    var size = 1            // 시작점을 포함하기 위해
    var queue = [(Int, Int)]()
    queue.append((row, col))

    while !queue.isEmpty {
        let (curRow, curCol) = queue.removeFirst()
        visited[curRow][curCol] = true
        
        for i in 0..<4 {
            let nextRow = curRow + dRow[i]
            let nextCol = curCol + dCol[i]
            
            if nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount {
                if board[nextRow][nextCol] == 1 && visited[nextRow][nextCol] == false {
                    queue.append( (nextRow, nextCol) )
                    visited[nextRow][nextCol] = true
                    size += 1
                }
            }
        }
    }

    return size
}

print(count, maxSize)

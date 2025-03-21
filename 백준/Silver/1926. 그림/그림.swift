let input = readLine()!.split(separator: " ").map { Int($0)! }
let (rowCount, colCount) = (input[0], input[1])
var board = [[Int]]()

for _ in 0..<rowCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(input)
}

let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]
var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
var maxSize = 0
var count = 0


for row in 0..<rowCount {
    for col in 0..<colCount {
        guard board[row][col] == 1 && visited[row][col] == false else { continue }
        let size = bfs(row, col)
        count += 1
        maxSize = max(maxSize, size)
    }
}

func bfs(_ row: Int, _ col: Int) -> Int {
    var size = 1
    var queue = [(Int, Int)]()
    queue.append((row, col))
    visited[row][col] = true
    
    var queueIdx = 0
    while queueIdx < queue.count {
        let (curRow, curCol) = queue[queueIdx]
        queueIdx += 1

        for i in 0..<4 {
            let nextRow = curRow + dRow[i]
            let nextCol = curCol + dCol[i]
            
            guard nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount else { continue }
            guard board[nextRow][nextCol] == 1 && visited[nextRow][nextCol] == false else { continue }
            queue.append((nextRow, nextCol))
            visited[nextRow][nextCol] = true
            size += 1
        }
    }
    
    return size
}

print(count)
print(maxSize)

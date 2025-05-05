/**
 m, n, h // m: 상자의 가로 칸의 수, n: 상자의 세로 칸의 수, h: 쌓아올려지는 상자의 수
 인접: 위, 아래, 왼쪽, 오른쪽, 앞
 */

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (colCount, rowCount, depthCount) = (input[0], input[1], input[2])

let dRow = [-1, 1, 0, 0, 0, 0]
let dCol = [0, 0, -1, 1, 0, 0]
let dDepth = [0, 0, 0, 0, -1, 1]

var board = [[[Int]]]()
var visited = Array(
    repeating: Array(
        repeating: Array(
            repeating: -1,
            count: colCount
        ),
        count: rowCount
    ), count: depthCount
)
var queue = [(Int, Int, Int)]()
var queueIdx = 0

var tomatoCount = 0
var ripenTomatoCount = 0
var totalDay = 0

for depth in 0..<depthCount {
    var matrix = [[Int]]()
    
    for row in 0..<rowCount {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        matrix.append(input)
        
        for col in 0..<colCount {
            if input[col] == 1 {
                queue.append((depth, row, col))
                visited[depth][row][col] = 0
                tomatoCount += 1
                ripenTomatoCount += 1
            } else if input[col] == 0 {
                tomatoCount += 1
            }
        }
    }
    
    board.append(matrix)
}

while queueIdx < queue.count {
    let (curDepth, curRow, curCol) = queue[queueIdx]
    queueIdx += 1
    
    totalDay = max(totalDay, visited[curDepth][curRow][curCol])
    
    for i in 0..<6 {
        let nextRow = curRow + dRow[i]
        let nextCol = curCol + dCol[i]
        let nextDepth = curDepth + dDepth[i]
        
        guard nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount && nextDepth >= 0 && nextDepth < depthCount else { continue }
        guard board[nextDepth][nextRow][nextCol] == 0 && visited[nextDepth][nextRow][nextCol] == -1 else { continue }
        
        queue.append((nextDepth, nextRow, nextCol))
        visited[nextDepth][nextRow][nextCol] = visited[curDepth][curRow][curCol] + 1
        ripenTomatoCount += 1
    }
}

if tomatoCount == ripenTomatoCount {
    print(totalDay)
} else {
    print(-1)
}


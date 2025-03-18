/**
 bfs: O(NM)임. 1인 곳마다 bfs를 돌리면 O((NM)^2)이 걸림.
 -> 큐를 전역 변수로 선언하고, 1인 좌표를 큐에 넣으면 됨.
 */

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (colCount, rowCount) = (input[0], input[1])
let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]

var dist = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
var board = [[Int]]()
var queue = [(Int, Int)]()

for _ in 0..<rowCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(input)
}

for row in 0..<rowCount {
    for col in 0..<colCount {
        if board[row][col] == 1 {
            queue.append((row, col))
        }
        if board[row][col] == 0 {
            dist[row][col] = -1
        }
    }
}

var index = 0
while index < queue.count {
    let (currRow, currCol) = queue[index]
    index += 1
    
    for i in 0..<4 {
        let nextRow = currRow + dRow[i]
        let nextCol = currCol + dCol[i]
        
        if nextRow < 0 || nextRow >= rowCount || nextCol < 0 || nextCol >= colCount { continue }
        if dist[nextRow][nextCol] >= 0 { continue }
        
        dist[nextRow][nextCol] = dist[currRow][currCol] + 1
        queue.append((nextRow, nextCol))
    }
}

var answer = 0
var isAllRiped = true
for row in 0..<rowCount {
    for col in 0..<colCount {
        if dist[row][col] == -1 {
            isAllRiped = false
        }
        answer = max(answer, dist[row][col])
    }
}

if isAllRiped {
    print(answer)
} else {
    print(-1)
}

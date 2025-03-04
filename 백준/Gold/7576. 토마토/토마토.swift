let input = readLine()!.split(separator: " ").map { Int($0)! }
let (colCount, rowCount) = (input[0], input[1])
var board = [[Int]]()

for _ in 0..<rowCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(input)
}

let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]
var dayBoard = board
var queue = [(Int, Int, Int)]()

func bfs() -> Int {
    var totalDay = 0
    var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
    var queueIndex = 0

    while queueIndex < queue.count {
        let (curRow, curCol, count) = queue[queueIndex]
        queueIndex += 1

        for i in 0..<4 {
            let nextRow = curRow + dRow[i]
            let nextCol = curCol + dCol[i]
            
            if nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount {
                if board[nextRow][nextCol] == 0 && visited[nextRow][nextCol] == false {
                    queue.append((nextRow, nextCol, count + 1))
                    visited[nextRow][nextCol] = true
                    if dayBoard[nextRow][nextCol] == 0 {
                        dayBoard[nextRow][nextCol] = count + 1
                    } else {
                        dayBoard[nextRow][nextCol] = min(dayBoard[nextRow][nextCol], count + 1)
                    }
                    totalDay = max(totalDay, dayBoard[nextRow][nextCol])
                }
            }
        }
    }

    return totalDay
}

for row in 0..<rowCount {
    for col in 0..<colCount {
        if board[row][col] == 1 {
            queue.append((row, col, 0))
        }
    }
}

let result = bfs()

let notRipeCount = dayBoard.reduce(0) { $0 + $1.filter { $0 == 0 }.count } > 0

if notRipeCount {
    print(-1)
} else {
    print(result)
}

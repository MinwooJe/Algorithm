let input = readLine()!.split(separator: " ").map { Int($0)! }
let (rowCount, colCount) = (input[0], input[1])
var board = [[Int]]()

for _ in 0..<rowCount {
    let input = readLine()!.map { Int(String($0))! }
    board.append(input)
}

let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]
var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)

func bfs() -> Int {
    var queue = [ (Int, Int, Int) ]()
    var result = 0

    queue.append((0, 0, 1))
    visited[0][0] = true
    
    while !queue.isEmpty {
        let (curRow, curCol, count) = queue.removeFirst()
        
        if curRow == rowCount - 1 && curCol == colCount - 1 {
            result = count
        }

        for i in 0..<4 {
            let nextRow = curRow + dRow[i]
            let nextCol = curCol + dCol[i]

            if nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount {
                if board[nextRow][nextCol] == 1 && visited[nextRow][nextCol] == false {
                    queue.append( (nextRow, nextCol, count + 1) )
                    visited[nextRow][nextCol] = true
                }
            }
        }
    }
    
    return result
}

print(bfs())

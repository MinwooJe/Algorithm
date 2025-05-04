/**
 배추 흰 지렁이: 해충잡아먹음 -> 상하좌우 인접한 영역 모두 커버 가능.
 
 */

let inputCount = Int(readLine()!)!
let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]

for _ in 0..<inputCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (rowCount, colCount, cabbageCount) = (input[0], input[1], input[2])
    
    var board = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
    var result = 0
    // 배추 위치 입력 받기
    for _ in 0..<cabbageCount {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (row, col) = (input[0], input[1])

        board[row][col] = 1
    }
    
    for row in 0..<rowCount {
        for col in 0..<colCount {
            guard board[row][col] == 1 && !visited[row][col] else { continue }
            
            result += 1
            
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
                    guard board[nextRow][nextCol] == 1 && !visited[nextRow][nextCol] else { continue }
                    
                    queue.append((nextRow, nextCol))
                    visited[nextRow][nextCol] = true
                }
            }
        }
    }
    
    print(result)
}
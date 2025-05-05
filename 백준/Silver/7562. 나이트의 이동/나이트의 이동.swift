let inputCount = Int(readLine()!)!
let dRow = [-2, -2, -1, -1, 1, 1, 2, 2]
let dCol = [-1, 1, -2, 2, -2, 2, -1, 1]

var visited = [[Int]]()

for _ in 0..<inputCount {
    let boardLength = Int(readLine()!)!
    let night = readLine()!.split(separator: " ").map { Int($0)! }
    let target = readLine()!.split(separator: " ").map { Int($0)! }
    
    visited = Array(repeating: Array(repeating: 0, count: boardLength), count: boardLength)
    let result = bfs(night, target, boardLength)
    print(result)
}

func bfs(_ night: [Int], _ target: [Int], _ len: Int) -> Int {
    var queue = [(Int, Int)]()
    var queueIdx = 0
    queue.append((night[0], night[1]))
    
    while queueIdx < queue.count {
        let (curRow, curCol) = queue[queueIdx]
        queueIdx += 1
        
        if curRow == target[0] && curCol == target[1] {
            return visited[curRow][curCol]
        }
        
        for i in 0..<8 {
            let nextRow = curRow + dRow[i]
            let nextCol = curCol + dCol[i]
            
            guard nextRow >= 0 && nextRow < len && nextCol >= 0 && nextCol < len else { continue }
            guard visited[nextRow][nextCol] == 0 else { continue }
            
            queue.append((nextRow, nextCol))
            visited[nextRow][nextCol] = visited[curRow][curCol] + 1
        }
    }
    
    return 0
}

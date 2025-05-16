let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, lower, upper) = (input[0], input[1], input[2])
let dRow = [-1, 1, 0, 0]
let dCol = [0, 0, -1, 1]

var worldMap = [[Int]]()
var result = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    worldMap.append(input)
}

while true {
    // 1. 연합 구하기
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var unions = [[(row: Int, col: Int)]]()

    for row in 0..<n {
        for col in 0..<n {
            guard !visited[row][col] else { continue }
            let union = getUnion(row, col)
            unions.append(union)
        }
    }
    
    // 연합이 더 이상 없으면 break
    guard unions.count != n * n else { break }
    
    // 2. 인구 이동
    for union in unions {
        guard !union.isEmpty else { continue }
        let avg = union.reduce(0) { $0 + worldMap[$1.row][$1.col] } / union.count
        
        for (row, col) in union {
            worldMap[row][col] = avg
        }
    }
    
    // 3. 횟수 갱신
    result += 1
    
    // 연합 구하는 함수(bfs)
    func getUnion(_ row: Int, _ col: Int) -> [(Int, Int)] {
        var union = [(row, col)]
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
                
                guard nextRow >= 0 && nextRow < n && nextCol >= 0 && nextCol < n else { continue }
                guard !visited[nextRow][nextCol] && isUnion(curRow, curCol, nextRow, nextCol) else { continue }
                queue.append((nextRow, nextCol))
                visited[nextRow][nextCol] = true
                union.append((nextRow, nextCol))
            }
        }

        return union
    }
}

func isUnion(_ curRow: Int, _ curCol: Int, _ nextRow: Int, _ nextCol: Int) -> Bool {
    let diff = abs(worldMap[nextRow][nextCol] - worldMap[curRow][curCol])
    return (lower...upper).contains(diff)
}

print(result)

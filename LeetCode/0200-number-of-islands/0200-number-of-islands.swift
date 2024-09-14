class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let rowCount = grid.count
        let colCount = grid[0].count
        var result = 0
        var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
        
        // grid 하나의 원소 씩 순회
        for row in 0..<rowCount {
            for col in 0..<colCount {
                if grid[row][col] == "1" && !visited[row][col] {
                    result += 1
                    bfs(row, col)
                }
            }
        }

        func bfs(_ row: Int, _ col: Int) {
            var queue = [(Int, Int)]()
            let dRow = [1, -1, 0, 0]
            let dCol = [0, 0, -1, 1]

            queue.append((row, col))
            visited[row][col] = false   // 얘가 35라인에서도 중복됨
            while !queue.isEmpty {
                // 큐에서 꺼내기
                let (curRow, curCol) = queue.removeFirst()
                // 상하좌우 순회
                for i in 0..<4 {
                    let nextRow = curRow + dRow[i]
                    let nextCol = curCol + dCol[i]
                    
                    if nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount {
                        if grid[nextRow][nextCol] == "1" && !visited[nextRow][nextCol] {
                            queue.append((nextRow, nextCol))
                            visited[nextRow][nextCol] = true
                        }
                    }
                }
            }
        }
        return result
    }
}

let s = Solution()
print(s.numIslands(  [["1","1","0","0","0"],
               ["1","1","0","0","0"],
               ["0","0","1","0","0"],
               ["0","0","0","1","1"]]))

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let rowCount = grid.count
        let colCount = grid[0].count
        var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
        var result = 0
        
        for row in 0..<rowCount {
            for col in 0..<colCount {
                if grid[row][col] == "1" && visited[row][col] == false {
                    bfs(row, col)
                    result += 1
                }
            }
        }
        
        func bfs(_ row: Int, _ col: Int) {
            let dRow = [-1, 1, 0, 0]
            let dCol = [0, 0, -1, 1]
            var queue = [(row, col)]
            
            while !queue.isEmpty {
                let (curRow, curCol) = queue.removeFirst()
                
                for i in 0..<4 {
                    let nextRow = curRow + dRow[i]
                    let nextCol = curCol + dCol[i]
                    
                    if nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount {
                        if grid[nextRow][nextCol] == "1" && visited[nextRow][nextCol] == false {
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

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let rowCount = grid.count
        let colCount = grid[0].count
        
        var result = 0
        var visited = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
        
        for row in 0..<rowCount {
            for col in 0..<colCount {
                if grid[row][col] == "1" && visited[row][col] == false {
                    result += 1
                    bfs(row, col)
                }
            }
        }
        
        func bfs(_ row: Int, _ col: Int) {
            var queue = [(Int, Int)]()
            queue.append((row, col))
            
            let dr = [-1, 1, 0, 0]
            let dc = [0, 0, -1, 1]
            while !queue.isEmpty {
                let (curRow, curCol) = queue.removeFirst()
                
                for i in 0..<4 {
                    let nextRow = curRow + dr[i]
                    let nextCol = curCol + dc[i]
                    if nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount {
                        if !visited[nextRow][nextCol] && grid[nextRow][nextCol] == "1" {
                            visited[nextRow][nextCol] = true
                            queue.append((nextRow, nextCol))
                        }
                    }
                }
                
            }
        }
        
        return result
    }
}
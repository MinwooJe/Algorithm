class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let rowCount = grid.count
        let colCount = grid[0].count
        var result = 0
        var visted = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
        
        for row in 0..<rowCount {
            for col in 0..<colCount {
                if visted[row][col] == false && grid[row][col] == "1" {
                    result += 1
                    dfs(row, col)
                }
            }
        }
        
        func dfs(_ row: Int, _ col: Int) {
            let dRow = [-1, 1, 0, 0]
            let dCol = [0, 0, -1, 1]
            
            visted[row][col] = true
            
            for i in 0..<4 {
                let nextRow = row + dRow[i]
                let nextCol = col + dCol[i]
                
                if nextRow >= 0 && nextRow < rowCount && nextCol >= 0 && nextCol < colCount
                    && grid[nextRow][nextCol] == "1"
                    && visted[nextRow][nextCol] == false {
                    visted[nextRow][nextCol] = true
                    dfs(nextRow, nextCol)
                }
            }
        }
        return result
    }
}
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var memo = Array(repeating: Array(repeating: -1, count: n), count: m)
        
        func dp(_ row: Int, _ col: Int) -> Int {
            if row <= 0 || col <= 0 {
                return 1
            }
            
            if memo[row][col] == -1 {
                memo[row][col] = dp(row - 1, col) + dp(row, col - 1)
            }
            
            return memo[row][col]
        }
        
        return dp(m - 1, n - 1)
    }
}
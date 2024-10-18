class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var memo = Array(repeating: Array(repeating: -1, count: n), count: m)

        for i in 0..<m {
            memo[i][0] = 1
        }

        for i in 0..<n {
            memo[0][i] = 1
        }

        for row in 1..<m {
            for col in 1..<n {
                memo[row][col] = memo[row - 1][col] + memo[row][col - 1]
            }
        }

        return memo[m - 1][n - 1]
    }
}
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var table = Array(repeating: Array(repeating: -1, count: n), count: m)

        for row in 0..<m {
            table[row][0] = 1
        }
        for col in 0..<n {
            table[0][col] = 1
        }
        
        guard m != 1 && n != 1 else { return 1 }
        
        for i in 1..<m {
            for j in 1..<n {
                table[i][j] = table[i - 1][j] + table[i][j - 1]
            }
        }

        return table[m - 1][n - 1]
    }
}
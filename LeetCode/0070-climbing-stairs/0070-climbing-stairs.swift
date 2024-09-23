class Solution {
    var memo: [Int: Int] = [1: 1, 2: 2]
    func climbStairs(_ n: Int) -> Int {
        guard n != 1 && n != 2 else { return memo[n]! }
        for i in 3...n {
            memo[i] = memo[i - 1]! + memo[i - 2]!
        }
        return memo[n]!
    }
}
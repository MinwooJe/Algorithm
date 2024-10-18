class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        func dp(_ n: Int) -> Int {
            var memo = [Int: Int]()
            memo[1] = 0
            memo[2] = 0
            
            for i in 3...n {
                memo[i] = min(memo[i - 1]! + cost[i - 2], memo[i - 2]! + cost[i - 3])
            }
            return memo[n]!
        }
        return dp(cost.count + 1)
    }
}

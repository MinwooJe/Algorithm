class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        func dp(_ n: Int) -> Int {
            var memo = [0: 0, 1: 0]
            
            for i in 2...n {
                memo[i] = min(memo[i - 1]! + cost[i - 1], memo[i - 2]! + cost[i - 2])
            }
            return memo[n]!
        }
        
        return dp(cost.count)
    }
}
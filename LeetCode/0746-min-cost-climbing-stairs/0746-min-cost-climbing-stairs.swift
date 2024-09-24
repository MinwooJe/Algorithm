class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var memo = [Int: Int]()
        
        func dp(_ n: Int) -> Int {
            if n == 1 || n == 2 {
                return 0
            }
            
            if !memo.keys.contains(n) {
                memo[n] = min(dp(n - 1) + cost[n - 2], dp(n - 2) + cost[n - 3])
            }
            return memo[n]!
        }
        return dp(cost.count + 1)
    }
}

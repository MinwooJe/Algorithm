class Solution {    
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var memo = [Int: Int]()
        
        func dp(_ n: Int) -> Int {
            guard n != 0 && n != 1 else { return 0 }
            
            if memo[n] == nil {
                memo[n] = min(dp(n - 1) + cost[n - 1], dp (n - 2) + cost[n - 2])
            }
            
            return memo[n]!
        }
        
        return dp(cost.count)
    }
}
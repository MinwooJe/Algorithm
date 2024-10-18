class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var memo = [Int: Int]()
        
        func up(to n: Int) -> Int {
            guard n != 0 && n != 1 else { return 0 }
            
            if !memo.keys.contains(n) {
                memo[n] = min(up(to: n - 1) + cost[n - 1], up(to: n - 2) + cost[n - 2])
            }
            
            return memo[n]!
        }
        
        return up(to: cost.count)
    }
}
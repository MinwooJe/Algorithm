class Solution {    
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        func dp(_ n: Int) -> Int {
            var table = [Int: Int]()
            (table[0], table[1]) = (0, 0)
            
            guard n != 0 && n != 1 else { return table[n]! }
            
            for i in 2...n {
                table[i] = min(table[i - 1]! + cost[i - 1], table[i - 2]! + cost[i - 2])
            }
            
            return table[n]!
        }
        
        return dp(cost.count)
    }
}
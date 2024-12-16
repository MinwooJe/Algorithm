class Solution {
    var memo = [Int: Int]()
    
    func climbStairs(_ n: Int) -> Int {
        if n == 1 || n == 2 {
            return n
        }
        
        if memo[n] == nil {
            memo[n] = climbStairs(n - 1) + climbStairs(n - 2)
        }
        
        return memo[n]!
    }
}
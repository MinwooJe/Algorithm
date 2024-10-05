func solution(_ n:Int) -> Int {
    var memo = Array(repeating: -1, count: n + 1)
    
    func dfs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        
        if memo[n] == -1 {
            memo[n] = (dfs(n - 1) + dfs(n - 2)) % 1234567
        }
        
        return memo[n]
    }

    return dfs(n)
}
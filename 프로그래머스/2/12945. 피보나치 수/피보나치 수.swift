func solution(_ n:Int) -> Int {
    var dp = Array(repeating: -1, count: n + 1)
    (dp[0], dp[1]) = (0, 1)
    
    for i in 2...n {
        dp[i] = (dp[i - 1] + dp[i - 2]) % 1234567
    }
    
    return dp[n]
}
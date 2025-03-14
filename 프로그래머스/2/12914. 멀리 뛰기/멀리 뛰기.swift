func solution(_ n:Int) -> Int {
    var dp = Array(repeating: -1, count: n + 1)
    if n == 1 {
        return 1
    } else if n == 2 {
        return 2
    }
    
    (dp[1], dp[2]) = (1, 2)
    for i in 3...n {
        dp[i] = (dp[i - 1] + dp[i - 2]) % 1234567
    }

    return dp[n]
}
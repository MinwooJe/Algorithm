func solution(_ n:Int) -> Int {    
    if n == 1 {
        return 1
    } else if n == 2 {
        return 2
    }

    var memo = Array(repeating: 0, count: n + 1)
    (memo[1], memo[2]) = (1, 2)

    for i in (3...n) {
        memo[i] = (memo[i - 1] + memo[i - 2]) % 1234567
    }

    
    return memo[n]
}
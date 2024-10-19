let n = Int(readLine()!)!

var memo = [Int: Int]()

func dp(_ n: Int) -> Int {
    if n == 1 {
        return 1
    }
    if n == 2 {
        return 2
    }
    
    if !memo.keys.contains(n) {
        memo[n] = (dp(n - 1) + dp(n - 2)) % 15746
    }
    
    return memo[n]!
}

print(dp(n))

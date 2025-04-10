let n = Int(readLine()!)!
var memo = Array(repeating: 1000001, count: n + 1)

if n == 1 {
    print(0)
} else if n == 2 || n == 3 {
    print(1)
} else {
    (memo[1], memo[2], memo[3]) = (0, 1, 1)

    for i in 4...n {
        memo[i] = memo[i - 1] + 1
        
        if i % 2 == 0 {
            memo[i] = min(memo[i], memo[i / 2] + 1)
        }
        if i % 3 == 0 {
            memo[i] = min(memo[i], memo[i / 3] + 1)
        }
    }

    print(memo[n])
}
let n = Int(readLine()!)!
var arr = [[Int]]()
var memo = Array(repeating: Array(repeating: 0, count: 3), count: n)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(input)
}

memo[0] = arr[0]

for i in 1..<n {
    memo[i][0] = arr[i][0] + min(memo[i - 1][1], memo[i - 1][2])
    memo[i][1] = arr[i][1] + min(memo[i - 1][0], memo[i - 1][2])
    memo[i][2] = arr[i][2] + min(memo[i - 1][0], memo[i - 1][1])
}

print(memo[n - 1].min()!)

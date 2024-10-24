let n = Int(readLine()!)!
var triangle = [[Int]]()
var memo = Array(repeating: Array(repeating: 0, count: n), count: n)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    triangle.append(input)
}
memo[0][0] = triangle[0][0]

for i in 1..<n {
    for j in 0...i {
        if j - 1 >= 0 && i - 1 >= j {
            memo[i][j] = triangle[i][j] + max(memo[i - 1][j], memo[i - 1][j - 1])
        } else if j - 1 < 0 {
            memo[i][j] = triangle[i][j] + memo[i - 1][j]
        } else if i - 1 < j {
            memo[i][j] = triangle[i][j] + memo[i - 1][j - 1]
        }
    }
}

print(memo[n - 1].max()!)

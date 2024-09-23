func solution() {
    var cache = Array(repeating: Array(repeating: Array(repeating: 1, count: 21), count: 21), count: 21)
    
    for a in 1...20 {
        for b in 1...20 {
            for c in 1...20 {
                cache[a][b][c] = (a < b && b < c)
                ? cache[a][b][c - 1] + cache[a][b - 1][c - 1] - cache[a][b - 1][c]
                : cache[a - 1][b][c] + cache[a - 1][b - 1][c] + cache[a - 1][b][c - 1] - cache[a - 1][b - 1][c - 1]
            }
        }
    }
    
    while let input = readLine()?.split(separator: " ").map({ Int($0)! }),
          input != [-1, -1, -1] {
        let (a, b, c) = (input[0], input[1], input[2])
        let result = (a <= 0 || b <= 0 || c <= 0) ? 1 : (a > 20 || b > 20 || c > 20) ? cache[20][20][20] : cache[a][b][c]
        print("w(\(a), \(b), \(c)) = \(result)")
    }
}

solution()

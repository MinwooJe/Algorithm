let n = Int(readLine()!)!

func fibonacci(_ n: Int) -> Int {
    guard n != 1 else { return 1 }
    guard n != 2 else { return 2 }
    
    var table = Array(repeating: 0, count: n + 1)
    (table[1], table[2]) = (1, 2)
    
    for i in 3...n {
        table[i] = (table[i - 1] + table[i - 2]) % 15746
    }
    
    return table[n]
}

print(fibonacci(n))
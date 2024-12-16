let n = Int(readLine()!)!

func fib(_ n: Int) -> Int {
    var table = [Int: Int]()
    (table[1], table[2]) = (1, 1)
    
    guard n != 1 && n != 2 else { return 1 }
    
    for i in 3...n {
        table[i] = table[i - 1]! + table[i - 2]!
    }
    
    return table[n]!
}

print(fib(n), n - 2)

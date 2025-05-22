func solution(_ n:Int) -> Int {
    var table = Array(repeating: 0, count: n + 1)
    
    if n == 1 {
        return 1
    } else if n == 2 {
        return 2
    }

    (table[1], table[2]) = (1, 2)
    
    for i in 3...n {
        table[i] = (table[i - 1] + table[i - 2]) % 1234567
    }

    return table[n]
}
func solution(_ n:Int) -> Int {
    var table = Array(repeating: 0, count: n + 1)
    table[1] = 1
    
    for i in 2...n {
        table[i] = (table[i - 1] + table[i - 2]) % 1234567
    }
    
    return table[n]
}
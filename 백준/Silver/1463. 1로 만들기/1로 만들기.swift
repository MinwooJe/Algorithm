let n = Int(readLine()!)!
var table = Array(repeating: 0, count: n + 1)

if n == 1 {
    print(0)
} else if n == 2 {
    print(1)
} else if n == 3 {
    print(1)
} else {
    if n < 3 {
        print(table[n])
    }
    
    for i in 2...n {
        table[i] = table[i - 1] + 1
        if i % 2 == 0 {
            table[i] = min(table[i], table[i / 2] + 1)
        }
        if i % 3 == 0 {
            table[i] = min(table[i], table[i / 3] + 1)
        }
    }
    
    print(table[n])
}

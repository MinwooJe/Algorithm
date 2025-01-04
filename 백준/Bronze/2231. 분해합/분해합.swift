let target = Int(readLine()!)!
var decomposition = 0

for i in 1...target {
    let candidate = i + String(i).map { Int(String($0))! }.reduce(0, +)
    if candidate == target {
        decomposition = i
        break
    }
}

print(decomposition)

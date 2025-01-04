let target = Int(readLine()!)!
var start = 1
var decomposition = 0

if target > 18 {
    start = target - String(target).count * 9
}

for i in start..<target {
    let candidate = i + String(i).map { Int(String($0))! }.reduce(0, +)
    if candidate == target {
        decomposition = i
        break
    }
}

print(decomposition)
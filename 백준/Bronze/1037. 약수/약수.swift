let n = Int(readLine()!)!
let divisor = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

let first = divisor.first!
let last = divisor.last!

print(first * last)

let len = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
let seq = readLine()!.split(separator: " ").map { Int($0)! }
print(zip(arr.sorted(), seq.sorted { $0 > $1 }).reduce(0) { $0 + $1.0 * $1.1 })
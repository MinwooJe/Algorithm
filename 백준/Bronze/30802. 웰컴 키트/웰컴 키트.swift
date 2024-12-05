let n = Int(readLine()!)!
let countBySize = readLine()!.split(separator: " ").map { Int($0)! }
let tp = readLine()!.split(separator: " ").map { Int($0)! }
let t = tp[0]
let p = tp[1]

print(countBySize.map { return $0 % t == 0 ? $0 / t : $0 / t + 1 }.reduce(0, +))
print(n / p, n % p)

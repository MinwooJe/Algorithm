let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var memo = Array(repeating: -1001, count: n)
memo[0] = arr[0]

for i in 1..<n {
    memo[i] = max(arr[i], arr[i] + memo[i - 1])
}

print(memo.max()!)
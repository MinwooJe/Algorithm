let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int($0)! }
var memo: [Int] = [arr[0]]

for i in 1..<n {
    memo.append(max(arr[i], arr[i] + memo[i - 1]))
}

print(memo.max()!)

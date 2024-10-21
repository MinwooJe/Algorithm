let n = Int(readLine()!)!
var costMap = [[Int]]()
var dpTable = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)

for _ in 0..<n {
    let inputLine = readLine()!.split(separator: " ").map { Int($0)! }
    costMap.append(inputLine)
}

dpTable[1] = costMap[0]

for i in 2...n {
    dpTable[i][0] = min(dpTable[i - 1][1], dpTable[i - 1][2]) + costMap[i - 1][0]
    dpTable[i][1] = min(dpTable[i - 1][0], dpTable[i - 1][2]) + costMap[i - 1][1]
    dpTable[i][2] = min(dpTable[i - 1][0], dpTable[i - 1][1]) + costMap[i - 1][2]
}

print(dpTable[n].min()!)

import Foundation

let n = Int(readLine()!)!
var sample = [Int]()
var sampleAppearCount = [Int: Int]()

for _ in 0..<n {
    let num = Int(readLine()!)!
    sample.append(num)
    sampleAppearCount[num, default: 0] += 1
}
sample = sample.sorted()

// sampleMode 순회
// 최빈값들 구하기
var modeKey = [Int]()
var maxAppearCount = 0
for (key, value) in sampleAppearCount {
    if value > maxAppearCount {
        modeKey.removeAll()
        modeKey.append(key)
        maxAppearCount = value
    } else if value == maxAppearCount {
        modeKey.append(key)
    }
}

let avg = Int(round(Double(sample.reduce(0, +)) / Double(n)))
let median = sample[n / 2]
let mode = modeKey.count > 1 ? modeKey.sorted()[1] : modeKey[0]
let range = sample[n - 1] - sample[0]

print(avg)
print(median)
print(mode)
print(range)

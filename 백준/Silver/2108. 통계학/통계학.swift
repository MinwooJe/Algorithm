import Foundation

let count = Int(readLine()!)!
var sample = [Int]()
var frequencyDict = [Int: Int]()

for _ in 0..<count {
    let input = Int(readLine()!)!
    sample.append(input)
}
sample = sample.sorted()

for i in sample {
    frequencyDict[i, default: 0] += 1
}
let maxFrequency = frequencyDict.values.max()!
let modes = frequencyDict.filter { $0.value == maxFrequency }.keys.sorted()

let avg = Int(round(Double(sample.reduce(0, +)) / Double(count)))
let median = sample[count / 2]
let mode = modes.count > 1 ? modes[1] : modes[0]
let range = sample[count - 1] - sample[0]

print(avg)
print(median)
print(mode)
print(range)

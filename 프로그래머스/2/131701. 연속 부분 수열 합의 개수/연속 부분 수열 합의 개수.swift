import Foundation

func solution(_ elements:[Int]) -> Int {
    var totalSum = [Int: Bool]()
    let addedElements = elements + elements
    
    for start in 0..<elements.count {
        var num = 0
        for i in 0..<elements.count {
            num += addedElements[start + i]
            totalSum[num] = true
        }
    }
    return totalSum.keys.count
}
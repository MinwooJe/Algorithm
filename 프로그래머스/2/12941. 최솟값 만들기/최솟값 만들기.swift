import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    let sortedA = A.sorted()
    let sortedB = B.sorted(by: >)
    var result = 0
    
    for (a, b) in zip(sortedA, sortedB) {
        result += a * b
    }

    return result
}
import Foundation

func solution(_ numbers:[Int]) -> Double {
    let result = Double(numbers.reduce(0, +)) / Double(numbers.count)
    return result
}
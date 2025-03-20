import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var stack = [(value: Int, idx: Int)]()
    var result = Array(repeating: 0, count: numbers.count)
    
    for (idx, num) in numbers.enumerated() {
        while !stack.isEmpty && stack[stack.count - 1].value < num {
            let (_, idx) = stack.removeLast()
            result[idx] = num
        }
        stack.append((num, idx))
    }
    
    while !stack.isEmpty {
        let (_, idx) = stack.removeLast()
        result[idx] = -1
    }
    
    return result
}
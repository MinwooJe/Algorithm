import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var stack = [(num: Int, idx: Int)]()
    var result = Array(repeating: -1, count: numbers.count)
    
    for (idx, num) in numbers.enumerated() {
        while !stack.isEmpty && stack[stack.count - 1].num < num {
            let (_, i) = stack.removeLast()
            result[i] = num
        }
        
        stack.append((num, idx))
    }
    
    return result
}
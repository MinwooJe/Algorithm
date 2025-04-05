import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var stack = [(idx: Int, num: Int)]()
    var result = Array(repeating: -1, count: numbers.count)
    
    for i in 0..<numbers.count {
        while !stack.isEmpty && stack[stack.count - 1].num < numbers[i] {
            let idx = stack.removeLast().idx
            result[idx] = numbers[i]
        } 
        
        stack.append((i, numbers[i]))
    }
    
    return result
}
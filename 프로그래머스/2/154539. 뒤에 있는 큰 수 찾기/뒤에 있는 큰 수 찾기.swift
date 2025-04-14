import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var stack = [(idx: Int, value: Int)]()
    var result = Array(repeating: -1, count: numbers.count)
    
    for i in 0..<numbers.count {
        let curr = numbers[i]
        
        while !stack.isEmpty && stack[stack.count - 1].value < curr {
            let (idx, _) = stack.removeLast()
            result[idx] = curr
        }
        
        stack.append((i, curr))
    }
    
    return result
}
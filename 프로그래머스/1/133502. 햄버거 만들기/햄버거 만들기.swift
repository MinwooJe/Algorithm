import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var stack = [Int]()
    var result = 0
    
    for i in ingredient {
        stack.append(i)
        if stack.count >= 4
        && stack[(stack.count - 4)...(stack.count - 1)] == [1, 2, 3, 1] {
            stack.removeLast()
            stack.removeLast()
            stack.removeLast()
            stack.removeLast()
            
            result += 1
        }
    }
    
    return result
}
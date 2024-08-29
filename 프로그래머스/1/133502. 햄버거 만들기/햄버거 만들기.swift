import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var stack = [Int]()
    var result = 0
    for i in ingredient {
        stack.append(i)
        
        if stack.count >= 4 && Array(stack.suffix(4)) == [1, 2, 3, 1] {
            result += 1
            
            stack.removeLast()
            stack.removeLast()
            stack.removeLast()
            stack.removeLast()
        }
    }
    return result
}
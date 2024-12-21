import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var stack = [Int]()
    var result = 0
    
    for i in ingredient {
        stack.append(i)
        let count = stack.count
        if count >= 4
        && stack[(count - 4)...(count - 1)] == [1, 2, 3, 1] {
            result += 1
            stack.popLast()
            stack.popLast()
            stack.popLast()
            stack.popLast()
        }
    }
    
    return result
}
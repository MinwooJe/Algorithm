import Foundation

func solution(_ s:String) -> Int {
    var stack = [Character]()
    
    for c in s {
        stack.append(c)
        if stack.count >= 2 && stack[stack.count - 1] == stack[stack.count - 2] {
            stack.removeLast()
            stack.removeLast()
        }
    }

    return stack.isEmpty ? 1 : 0
}
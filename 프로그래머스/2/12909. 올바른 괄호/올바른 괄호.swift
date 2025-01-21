import Foundation

func solution(_ s:String) -> Bool {
    var answer = false
    var stack = [Character]()

    for c in s {
        if c == "(" {
            stack.append(")")
        } else {
            if stack.isEmpty {
                return false
            } else {
                stack.removeLast()
            }
        }
    }
    
    if !stack.isEmpty {
        return false
    } else {
        return true
    }
}
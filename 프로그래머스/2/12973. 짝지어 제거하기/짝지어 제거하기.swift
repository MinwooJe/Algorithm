import Foundation

func solution(_ s:String) -> Int{
    var answer = 0
    var stack = [Character]()
    
    for c in s {
        if !stack.isEmpty && stack[stack.count - 1] == c {
            stack.removeLast()
        } else {
            stack.append(c)
        }
    }

    return stack.isEmpty ? 1 : 0
}
import Foundation

func solution(_ s:String) -> Bool {
    var answer = true
    var stack = [Character]()
    
    for c in s {
        if c == "(" {
            stack.append(")")
        } else if c == ")"  && stack.isEmpty {
            answer = false
            break
        } else if c == ")" {
            stack.removeLast()
        }
    }
    
    if !stack.isEmpty {
        answer = false
    }
    
    return answer
}
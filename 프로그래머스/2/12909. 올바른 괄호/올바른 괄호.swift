import Foundation

func solution(_ str:String) -> Bool {
    var stack = [String]()
    
    for s in str {
        if s == "(" {
            stack.append(")")
        } else {
            if !stack.isEmpty {
                stack.removeLast()
            } else {
                return false
            }
        }
    }
    return stack.isEmpty
}
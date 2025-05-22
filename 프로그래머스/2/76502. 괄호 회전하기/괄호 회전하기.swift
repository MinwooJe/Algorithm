import Foundation

func solution(_ s:String) -> Int {
    var doubled = Array(s + s)
    var result = 0
    
    for i in 0..<s.count {
        let rotated = Array(doubled[i..<i + s.count])
        result += isValid(rotated) ? 1 : 0
    }

    return result
}

func isValid(_ s: [Character]) -> Bool {
    var stack = [Character]()
    
    for c in s {
        if c == "(" {
            stack.append(")")
        } else if c == "[" {
            stack.append("]")
        } else if c == "{" {
            stack.append("}")
        } else {
            if stack.isEmpty || !stack.isEmpty && stack.last! != c {
                return false
            } else {
                stack.removeLast()
            }
        }
    }
    
    return stack.isEmpty
}
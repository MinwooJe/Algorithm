import Foundation

// O(n^2) 미만이면 괜찮을 듯.
// 괄호 판별 함수 만들어서 완탐
func solution(_ s:String) -> Int {
    let count = s.count
    let s = Array(s) + Array(s)
    var result = 0

    for i in 0..<count {
        let sliced = Array(s[i..<(i + count)])
        result += isValid(sliced) ? 1 : 0
    }

    return result
}

func isValid(_ s: [Character]) -> Bool {
    var stack = [Character]()

    for c in s {
        if c == "(" {
            stack.append(")")
        } else if c == "{" {
            stack.append("}")
        } else if c == "[" {
            stack.append("]")
        } else if c == ")" || c == "}" || c == "]" {
            if !stack.isEmpty && stack[stack.count - 1] == c {
                stack.removeLast()
            } else {
                return false
            }
        }
    }

    return stack.isEmpty
}
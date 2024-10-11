import Foundation

func solution(_ p: String) -> String {
    guard p != "" else { return "" }
    
    let (u, v) = splitUV(p)
    
    if isValidString(u) {
        return u + solution(v)
    } else {
        // 진짜로 뒤집어야 됨.
        var arr = Array(u)
        arr.removeLast()
        arr.removeFirst()
        var result = ""
        for i in 0..<arr.count {
            if arr[i] == "(" {
                result += ")"
            } else {
                result += "("
            }
        }
        // check
        return "(" + solution(v) + ")" + result
    }
    return solution(p)
}

func splitUV(_ w: String) -> (String, String) {
    var openCount = 0
    var closeCount = 0
    var end = w.count
    let arr = Array(w)
    
    for i in 0..<arr.count {
        if openCount == closeCount && openCount != 0 {
            end = i
            break
        }
        if arr[i] == "(" {
            openCount += 1
        } else {
            closeCount += 1
        }
    }
    
    let u = String(arr[0..<end])
    let v = String(arr[end..<arr.count])
    
    return (u, v)
}


func isValidString(_ string: String) -> Bool {
    var stack = [String]()
    
    for str in string {
        if str == "(" {
            stack.append(")")
        } else {
            if stack.isEmpty {
                return false
            } else {
                stack.popLast()
            }
        }
    }
    return true
}
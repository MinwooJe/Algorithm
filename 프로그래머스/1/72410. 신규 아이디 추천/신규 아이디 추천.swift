import Foundation

// ID 제약 조건 - 소문자, 숫자, 빼기, 밑줄, 마침표 문자만 사용 가능
func solution(_ new_id:String) -> String {
    var newID = new_id
    var stack = [Character]()
    
    // 1단계
    newID = newID.lowercased()
    
    // 2단계
    newID = newID.filter { $0.isLetter || $0.isNumber || $0 == "-" || $0 == "_" || $0 == "." }
    
    // 3단계
    for c in newID {
        stack.append(c)
        let lastIdx = stack.count - 1
        if stack.count >= 2 
        && stack[lastIdx] == "." && stack[lastIdx - 1] == "." {
            stack.removeLast()
        }
    }
    
    // 4단계
    if !stack.isEmpty && stack[0] == "." {
        stack.removeFirst()
    }
    if !stack.isEmpty && stack[stack.count - 1] == "." {
        stack.removeLast()
    }
    newID = String(stack)

    // 5단계
    if stack.isEmpty {
        stack.append("a")
    }

    // 6단계
    if stack.count >= 16 {
        stack = Array(stack[0..<15])
    }
    if !stack.isEmpty && stack[stack.count - 1] == "." {
    stack.removeLast()
    }
    
    // 7단계
    while stack.count < 3 {
        if let lastChar = stack.last {
            stack.append(lastChar)
        }
    }
    
    newID = String(stack)
    return newID
}
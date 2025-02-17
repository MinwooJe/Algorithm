import Foundation

/**
- 길이: 3~ 15
- 알파벳 소문자, 숫자, 특수문자(-, _, .)
- 마침표는 처음과 끝에만 사용 가능, 연속 불가
*/
func solution(_ new_id:String) -> String {
    // 1단계 & 2단계
    var new_id = new_id
        .lowercased()   
        .filter { $0.isLetter || $0.isNumber || $0 == "-" || $0 == "_" || $0 == "." } 

    // 3단계
    var stack = [Character]()
    for c in new_id {
        stack.append(c)
        let count = stack.count
        if stack.count >= 2 && stack[count - 1] == "." && stack[count - 2] == "." {
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
    
    // 5단계
    if stack.isEmpty {
        stack.append("a")
    }
    
    // 6단계
    if stack.count >= 16 {
        stack = Array(stack[0..<15])
        if stack[stack.count - 1] == "." {
            stack.removeLast()
        }
    }
    
    // 7단계
    if stack.count < 3 {
        let lastChar = stack[stack.count - 1]
        while stack.count < 3 {
            stack.append(lastChar)
        }
    }
    
    let result = stack.map { String($0) }.joined(separator: "")
    return result
}
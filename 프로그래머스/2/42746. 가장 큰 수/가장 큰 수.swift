import Foundation

func solution(_ numbers:[Int]) -> String {
    let result = numbers
        .map { String($0)}
        .sorted { String(repeating: $0, count: 3) > String(repeating: $1, count: 3) }
        .joined(separator: "")
    
    if Set(result) == ["0"] {
        return "0"
    } else {
        return result
    }
}
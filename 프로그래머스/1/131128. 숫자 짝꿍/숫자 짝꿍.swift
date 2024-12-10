import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var answer = ""
    
    for num in stride(from: 9, to: -1, by: -1) {
        let charNum = Character(String(num))
        let xCount = X.filter { $0 == charNum }.count
        let yCount = Y.filter { $0 == charNum }.count
        
        answer += String(repeating: charNum, count: min(xCount, yCount))
    }
    
    if answer.isEmpty {
        return "-1"
    } else if Set(answer) == ["0"] {
        return "0"
    } else {
        return answer
    }
}
import Foundation

func solution(_ str1:String, _ str2:String) -> String {
    var answer = ""
    for (c1, c2) in zip(str1, str2) {
        answer += String(c1) + String(c2)
    }
    return answer
}
import Foundation

func solution(_ my_strings:[String], _ parts:[[Int]]) -> String {
    var answer = ""
    for (str, part) in zip(my_strings, parts) {
        let start = str.index(str.startIndex, offsetBy: part[0])
        let end = str.index(str.startIndex, offsetBy: part[1])
        answer += str[start...end]
    }
    
    return answer
}
import Foundation

func solution(_ my_string:String, _ index_list:[Int]) -> String {
    var answer = ""
    for idx in index_list {
        let i = my_string.index(my_string.startIndex, offsetBy: idx)
        answer += String(my_string[i])
    }
    return answer
}
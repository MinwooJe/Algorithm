import Foundation

func solution(_ my_string:String, _ n:Int) -> String {
    let startIdx = my_string.startIndex
    let endIdx = my_string.index(startIdx, offsetBy: n)

    let answer = String(my_string[startIdx..<endIdx])

    return answer
}
import Foundation

/**
var num = n
var binaryN = String(n, radix: 2)
loop
    num += 1
    if binaryN.filter { $0 == 1 } == String(n, radix: 2).filter { $0 == 1}
*/
func solution(_ n:Int) -> Int {
    var answer = 0
    var num = n
    let oneCountOfBinaryN = String(n, radix: 2).filter { $0 == "1"}
    
    while true {
        num += 1
        if String(num, radix: 2).filter { $0 == "1"} == oneCountOfBinaryN {
            answer = num
            break
        }
    }

    return answer
}
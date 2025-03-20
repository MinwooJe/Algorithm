import Foundation
/**
0. var x = s
1. xs의 모든 0 제거
2. String(len(s), radix: 2)
*/
func solution(_ s:String) -> [Int] {
    var x = s
    var deletedZeroCount = 0
    var result = 0
    
    while x != "1" {
        let deletedZero = x.filter { $0 != "0" }
        deletedZeroCount += x.count - deletedZero.count
        result += 1
        
        x = String(deletedZero.count, radix: 2)
    }
    
    return [result, deletedZeroCount]
}
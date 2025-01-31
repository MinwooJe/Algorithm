import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    var transCount = 0
    var deletedZeroCount = 0
    
    while s.count > 1 {
        var zeroCount = s.filter { $0 == "0"}.count
        let length = s.count - zeroCount
        s = String(length, radix: 2)
        deletedZeroCount += zeroCount
        transCount += 1
    }

    return [transCount, deletedZeroCount]
}
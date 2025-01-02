import Foundation

func solution(_ s:String) -> [Int] {
    var x = s
    var deletedZeroCount = 0
    var transCount = 0
    
    while x != "1" {
        let currentCount = x.count
        let oneCount = x.filter { $0 == "1" }.count
        deletedZeroCount += currentCount - oneCount
        transCount += 1
        
        x = String(oneCount, radix: 2)
}
    
    return [transCount, deletedZeroCount]
}

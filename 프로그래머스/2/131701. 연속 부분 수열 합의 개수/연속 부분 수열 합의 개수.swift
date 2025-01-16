import Foundation
/**
길이가 1부터 n까지
    start
        start부터 end까지


*/
func solution(_ elements:[Int]) -> Int {
    let circular = elements + elements
    var totalSum = Set<Int>()
    
    for start in 0..<elements.count {
        var num = 0
        for i in 0..<elements.count {
            num += circular[start + i]
            totalSum.insert(num)
        }
    }
    
    return totalSum.count
}
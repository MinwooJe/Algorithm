import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var budget = budget
    var d = d.sorted()
    
    var i = 0
    while i < d.count && budget - d[i] >= 0 {
        budget -= d[i]
        i += 1
    }
    return i
}
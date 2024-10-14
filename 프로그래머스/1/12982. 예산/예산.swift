import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var budget = budget
    var result = 0
    
    for part in d.sorted() {
        if budget - part < 0 {
            break
        }
        budget -= part
        result += 1
    }
    
    return result
}
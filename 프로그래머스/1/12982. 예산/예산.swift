import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var budget = budget
    var result = 0
    
    for money in d.sorted() {
        guard budget - money >= 0 else { break }
        budget -= money
        result += 1
    }
    
    return result
}
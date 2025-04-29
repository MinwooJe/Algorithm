import Foundation

func solution(_ topping:[Int]) -> Int {
    var result = 0
    var older = Set<Int>()
    var elder = [Int: Int]()
    
    for t in topping {
        elder[t, default: 0] += 1
    }
    
    for t in topping {
        older.insert(t)
        elder[t, default: 0] -= 1
        
        if elder[t, default: 0] <= 0 {
            elder[t] = nil
        }
        
        if older.count == elder.count {
            result += 1
        }
    }
    
    return result
}
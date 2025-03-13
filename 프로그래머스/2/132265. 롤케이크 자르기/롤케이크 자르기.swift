import Foundation

// 동일한 가짓수의 토핑 -> 공평
func solution(_ topping:[Int]) -> Int {
    var kindOfTopping = [Int: Int]()
    var olderTopping = Set<Int>()
    var result = 0

    for t in topping {
        kindOfTopping[t, default: 0] += 1
    }

    for t in topping {
        kindOfTopping[t, default: 0] -= 1
        olderTopping.insert(t)
        
        if kindOfTopping[t, default: 0] <= 0 {
            kindOfTopping.removeValue(forKey: t)
        }

        if kindOfTopping.count == olderTopping.count {
            result += 1
        }
    }
    
    return result
}
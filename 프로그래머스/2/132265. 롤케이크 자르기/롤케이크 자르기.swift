import Foundation

func solution(_ topping:[Int]) -> Int {
    var rightTopping = [Int: Int]()
    var leftTopping = Set<Int>()
    var result = 0

    for t in topping {
        rightTopping[t, default: 0] += 1
    }
    
    for t in topping {
        rightTopping[t, default: 0] -= 1
        leftTopping.insert(t)

        if rightTopping[t, default: 0] <= 0 {
            rightTopping[t] = nil
        }
        
        if leftTopping.count == rightTopping.count {
            result += 1
        }
    }
    
    return result
}
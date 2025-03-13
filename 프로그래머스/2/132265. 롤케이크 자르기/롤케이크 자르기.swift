import Foundation

func solution(_ topping:[Int]) -> Int {
    var result = 0
    var leftTopping = Set<Int>()
    var rightTopping = [Int: Int]()     // [토핑 종류: 개수]
    
    for t in topping {
        rightTopping[t, default: 0] += 1
    }

    for t in topping {
        rightTopping[t]! -= 1
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
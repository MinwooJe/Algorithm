import Foundation

func solution(_ order:[Int]) -> Int {
    var target = 0
    var stack = [Int]()
    var result = 0

    for num in 1...order.count {
        if order[target] != num {
            if stack.isEmpty {
                stack.append(num)
                continue
            }
            
            while !stack.isEmpty && stack.last! == order[target] {
                target += 1
                result += 1
                stack.removeLast()
            }

            if stack.last != order[target] {
                stack.append(num)
                continue
            }
        }

        if num == order[target] {
            result += 1
            target += 1
        }
    }

    while !stack.isEmpty && stack.last! == order[target] {
        target += 1
        result += 1
        stack.removeLast()
    }
    
    return result
}
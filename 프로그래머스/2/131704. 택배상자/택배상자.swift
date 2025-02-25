import Foundation

func solution(_ order:[Int]) -> Int {
    var stack = [Int]()
    var number = 1
    var result = 0

    for o in order {
        while number <= o {
            stack.append(number)
            number += 1
        }

        if stack.last! == o {
            stack.removeLast()
            result += 1
        } else {
            break
        }
    }
    return result
}
import Foundation

func solution(_ order:[Int]) -> Int {
    var result = 0
    var stack = [Int]()
    var parcel = 1
    
    for o in order {
        while parcel <= o {
            stack.append(parcel)
            parcel += 1
        }

        if stack.last! == o {
            result += 1
            stack.removeLast()
        } else {
            break
        }
    }
    
    return result
}
import Foundation

func solution(_ s:String) -> Int{
    var answer:Int = -1
    var stack = [Character]()

    for c in s {
        if let lastCharacter = stack.last {
            if c == lastCharacter {
                stack.removeLast()
                continue
            }
        }
        stack.append(c)
    }
    
    if stack.isEmpty {
        return 1
    } else {
        return 0
    }
}
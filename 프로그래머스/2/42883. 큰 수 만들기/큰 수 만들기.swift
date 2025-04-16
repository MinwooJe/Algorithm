import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let number = Array(number)
    var stack = [Character]()
    var deletedCount = 0

    for i in 0..<number.count {
        let curr = number[i]
        
        while deletedCount < k && !stack.isEmpty && stack[stack.count - 1] < curr {
            stack.removeLast()
            deletedCount += 1
        }
        stack.append(curr)
    }
    
    while deletedCount < k {
        stack.removeLast()
        deletedCount += 1
    }

    return String(stack)
}
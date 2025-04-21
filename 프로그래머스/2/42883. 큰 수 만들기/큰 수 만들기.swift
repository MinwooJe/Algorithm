import Foundation
/**
최대한 앞의 가장 작은 수들을 없애는게 좋음.
*/
func solution(_ number:String, _ k:Int) -> String {
    var stack = [Character]()
    var deletedCount = 0
    
    for num in number {
        while !stack.isEmpty && stack[stack.count - 1] < num && deletedCount < k {
            stack.removeLast()
            deletedCount += 1
        }

        stack.append(num)
    }
    
    while stack.count > number.count - k {
        stack.removeLast()
    }
    
    return String(stack)
}
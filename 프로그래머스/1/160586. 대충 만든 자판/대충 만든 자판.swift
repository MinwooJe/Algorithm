import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    let maximumTyping = 999
    var minTypingDict = [Character: Int]()
    var result = [Int]()
    
    for key in keymap {
        for (idx, c) in key.enumerated() {
            minTypingDict[c] = min(idx + 1, minTypingDict[c, default: maximumTyping])
        }
    }

    for target in targets {
        var sum = 0
        for t in target {
            guard let count = minTypingDict[t] else {
                sum = -1
                break
            }
            sum += count
        }
        result.append(sum)
    }
    
    return result
}
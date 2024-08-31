import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var result = [Int]()
    var keyDict = [Character: Int]()
    
    for key in keymap {
        key.enumerated().forEach { (index, k) in
            if keyDict[k] == nil {
                keyDict[k] = index
            } else {
                keyDict[k] = min(keyDict[k]!, index)
            }
        }
    }
    
    for target in targets {
        var sum = 0
        
        for t in target {
            if keyDict[t] == nil {
                sum = -1
                break
            } else {
                sum += keyDict[t]! + 1
            }
        }
        result.append(sum)
    }
    
    return result
}
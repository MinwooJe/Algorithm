import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var result = [Int]()
    var keyDict = [Character: Int]()
    
    for key in keymap {
        let key = Array(key)
        for k in key {
            let index = key.firstIndex(of: k)!
            if keyDict[k] == nil {
                keyDict[k] = index
            } else {
                keyDict[k] = min(keyDict[k]!, index)
            }
        }
    }

    for target in targets {
        var count = 0
        for t in target {
            if keyDict[t] == nil {
                count = -1
                break
            } else {
                count += keyDict[t]! + 1
            }
        }
        result.append(count)
    }
    
    return result
}
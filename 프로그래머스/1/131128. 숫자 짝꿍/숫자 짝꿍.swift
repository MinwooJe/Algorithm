import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var xNumCountDict = [Character: Int]()
    var yNumCountDict = [Character: Int]()
    var result = ""
    
    for x in X {
        xNumCountDict[x, default: 0] += 1
    }
    
    for y in Y {
        yNumCountDict[y, default: 0] += 1
    }
    
    for x in xNumCountDict.keys {
        guard yNumCountDict[x] != nil else { continue }
        let minCount = min(xNumCountDict[x]!, yNumCountDict[x]!)
        result += String(repeating: x, count: minCount)
    }
    
    result = String(result.sorted(by: >))
    
    if result == "" {
        return "-1"
    } else if Set(result) == ["0"] {
        return "0"
    } else {
        return result
    }
    
    return ""
}
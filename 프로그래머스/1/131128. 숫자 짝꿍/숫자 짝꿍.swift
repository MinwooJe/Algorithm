import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var xDict = [Character: Int]()
    var yDict = [Character: Int]()
    var result = ""
    
    X.forEach { xDict[$0, default: 0] += 1}
    Y.forEach { yDict[$0, default: 0] += 1}
    
    for x in xDict.keys {
        if let xCount = xDict[x],
           let yCount = yDict[x] {
               result += String(repeating: x, count: min(xCount, yCount))
        }
    }
    
    
    if result == "" {
        return "-1"
    } else if Set(result) == ["0"] {
        return "0"
    } else {
        return String(result.sorted(by: >))
    }
}
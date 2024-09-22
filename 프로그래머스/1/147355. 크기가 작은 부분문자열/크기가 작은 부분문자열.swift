import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var result = 0
    let iterCount = t.count - p.count + 1
    
    for i in 0..<iterCount {
        let startIndex = t.index(t.startIndex, offsetBy: i)
        let endIndex = t.index(startIndex, offsetBy: p.count - 1)
        if t[startIndex...endIndex] <= p {
            result += 1
        }
    }
    return result
}
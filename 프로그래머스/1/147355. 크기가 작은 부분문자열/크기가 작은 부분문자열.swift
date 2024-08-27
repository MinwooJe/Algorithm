import Foundation

func solution(_ t:String, _ p:String) -> Int {
    let iterCount = t.count - p.count + 1
    var count = 0
    
    for i in 0..<iterCount {
        let start = t.index(t.startIndex, offsetBy: i)
        let end = t.index(start, offsetBy: p.count - 1)
        if t[start...end] <= p {
            count += 1
        }
    }
    return count
}
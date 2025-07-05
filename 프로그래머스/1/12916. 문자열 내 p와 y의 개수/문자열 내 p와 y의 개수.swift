import Foundation

func solution(_ s:String) -> Bool {
    var pCount = 0
    var yCount = 0

    for c in s.lowercased() {
        if c == "p" {
            pCount += 1
        } else if c == "y" {
            yCount += 1
        } else {
            continue
        }
    }
    
    return pCount == yCount
}
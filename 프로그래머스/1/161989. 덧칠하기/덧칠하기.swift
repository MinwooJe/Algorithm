import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var result: Int = 0
    var lastSection: Int = 0
    
    for s in section {
        if s <= lastSection {
            continue
        }
        lastSection = s + m - 1
        result += 1
    }
    
    return result
}
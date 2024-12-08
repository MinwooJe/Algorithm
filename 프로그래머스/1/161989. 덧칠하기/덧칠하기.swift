import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var result = 0
    var endOfPaintedIdx = 0
    
    for s in section {
        if s > endOfPaintedIdx {
            endOfPaintedIdx = s + m - 1
            result += 1
        }
    }
    
    return result
}
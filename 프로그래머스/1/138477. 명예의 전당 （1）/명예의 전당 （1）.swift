import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var hallOfFame = [Int]()
    var result = [Int]()
    
    for s in score {
        if hallOfFame.count == k {
            hallOfFame[k - 1] = max(hallOfFame[k - 1], s)
        } else {
            hallOfFame.append(s)
        }
        hallOfFame = hallOfFame.sorted(by: >)
        result.append(hallOfFame[hallOfFame.count - 1])
    }
    
    return result
}
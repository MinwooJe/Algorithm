import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var hallOfFame = [Int]()
    var result = [Int]()
    
    for s in score {
        if hallOfFame.count == k {
            hallOfFame[k - 1] = max(s, hallOfFame[k - 1])
        } else {
            hallOfFame.append(s)
        }
        hallOfFame = hallOfFame.sorted(by: >)
        result.append(hallOfFame[hallOfFame.count - 1])
    }
    
    return result
}
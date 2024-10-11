import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    // [맞힌 개수: 등수]
    let rankHash = [6: 1, 5: 2, 4: 3, 3: 4, 2: 5, 1: 6, 0: 6]
    var zeroCount = 0
    var winCount = 0
    
    for num in lottos {
        if num == 0 {
            zeroCount += 1
        }
        
        if win_nums.contains(num) {
            winCount += 1
        }
    }
    
    let maxRank = rankHash[winCount + zeroCount]!
    let minRank = rankHash[winCount]!
    
    return [maxRank, minRank]
}
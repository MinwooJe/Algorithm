import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var correctCount = 0
    let winNumsDict = Dictionary(uniqueKeysWithValues: zip(win_nums, Array(repeating: true, count: 6)))
                                 
    for num in lottos {
        if winNumsDict[num] != nil {
            correctCount += 1
        }
    }
    
    let zeroCount = lottos.filter { $0 == 0 }.count
    let minRank = convertToRank(for: correctCount)
    let maxRank = convertToRank(for: correctCount + zeroCount)
    
    return [maxRank, minRank]
}

func convertToRank(for correctCount: Int) -> Int {
    return correctCount >= 2 ? 7 - correctCount : 6
}
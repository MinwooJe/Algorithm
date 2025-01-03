import Foundation

func solution(_ land:[[Int]]) -> Int{
    var answer = 0
    var dpTable = Array(repeating: Array(repeating: 0, count: 4), count: land.count)
    dpTable[0] = land[0]
    
    for row in 1..<land.count {
        for col in 0..<4 {
            for i in 0..<4 {
                guard i != col else { continue }
                dpTable[row][col] = max(dpTable[row][col], land[row][col] + dpTable[row - 1][i])
            }
        }
    }

    return dpTable[land.count - 1].max()!
}
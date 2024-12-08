import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    var playerRankDict = [String: Int]()
    
    for (idx, player) in players.enumerated() {
        playerRankDict[player] = idx
    }
    
    for winnerName in callings {
        let winnerIdx = playerRankDict[winnerName]!
        let looserName = players[winnerIdx - 1]
        let looserIdx = playerRankDict[looserName]!
        
        playerRankDict[winnerName, default: 0] -= 1
        playerRankDict[looserName, default: 0] += 1
        
        players.swapAt(winnerIdx, looserIdx)
    }
    
    return players
}
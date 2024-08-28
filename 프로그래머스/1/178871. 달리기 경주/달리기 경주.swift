import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var playersDict = [String: Int]()
    var players = players
    for (index, player) in players.enumerated() {
        playersDict[player] = index
    }
    
    for winner in callings {
        let winnerIdx = playersDict[winner]!
        let loser = players[winnerIdx - 1]
        playersDict[winner]! -= 1
        playersDict[loser]! += 1
        
        (players[winnerIdx], players[winnerIdx - 1]) = (players[winnerIdx - 1], players[winnerIdx])
    }
    
    return players
}
import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    var rank = [String: Int]()
    
    for (index, value) in players.enumerated() {
        rank[value] = index
    }
    
    for winner in callings {
        let winnerIndex = rank[winner]!
        let loser = players[winnerIndex - 1]
        
        rank[winner]! -= 1
        rank[loser]! += 1
        
        players.swapAt(winnerIndex, winnerIndex - 1)
    }
    
    return players
}
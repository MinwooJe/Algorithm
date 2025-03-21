import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = 0
    
    func backtrack(_ currHp: Int, _ curr: [Int]) {
        result = max(result, curr.count)
        
        for i in 0..<dungeons.count {
            let dungeon = dungeons[i]
            if !curr.contains(i) && currHp >= dungeon[0] {
                backtrack(currHp - dungeon[1], curr + [i])
            }
        }
    }
    
    backtrack(k, [])
    
    return result
}
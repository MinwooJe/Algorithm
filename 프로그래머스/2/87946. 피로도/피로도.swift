import Foundation

// k: 유저의 현재 피로도, dungeons: [던전 별 최소 필요 피로도, 소모 피로도]
// 유저가 탐험할 수 있는 최대 던전 수
func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var maxCount = 0
    
    func backtrack(_ k: Int, _ count: Int, _ visited: [Bool]) {
        maxCount = max(maxCount, count)
        
        for i in 0..<dungeons.count {
            if !visited[i] && k >= dungeons[i][0] {
                var newVisited  = visited
                newVisited[i] = true
                backtrack(k - dungeons[i][1], count + 1, newVisited)
            }
        }
    }
    
    backtrack(k, 0, Array(repeating: false, count: dungeons.count))
    return maxCount
}

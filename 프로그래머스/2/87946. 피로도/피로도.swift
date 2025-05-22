import Foundation

/**
완탐 이유: 최소 피로도가 낮은 순으로 해도 최적해 보장 x, 소모 피로도 순으로 해도 최적해 보장 x
-> 둘 다 따져보면서 순서를 정해야하므로 백트래킹을 하면 됨.
- 시간 복잡도: 8! = 720 * 72 이므로 충분
*/
func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = 0

    func backtrack(_ hp: Int, _ visited: Set<Int>) {
        var visited = visited
        result = max(visited.count, result)
        
        for i in 0..<dungeons.count {
            if !visited.contains(i) && hp >= dungeons[i][0]{
                visited.insert(i)
                backtrack(hp - dungeons[i][1], visited)
                visited.remove(i)
            }
        }
    }

    backtrack(k, [])
    return result
}
import Foundation
/**
1. 최소 필요 피로도가 낮은 순으로 정렬하면 되는거 아님?
-> ㄴㄴ 소모 피로도도 중요함. 내 체력이 있어야 던전을 더 탐색할 수 있으니
-> 그냥 완탐해야겠는데?

2. 백트래킹
백트랙 기준: 최소 필요 피로도 > 현재 피로도
방문한 던전은 방문 안해: curr에 없으면 됨.
*/
func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var currHp = k
    var result = 0
    
    func backtrack(_ currHp: Int, _ curr: [Int]) {
        result = max(result, curr.count)
        
        for i in 0..<dungeons.count {
            guard currHp >= dungeons[i][0] && !curr.contains(i) else { continue }
            backtrack(currHp - dungeons[i][1], curr + [i])
        }
    }
    
    backtrack(currHp, [])
    return result
}
import Foundation
/**
bfs로 가다가 curr == target이 되는 첫 순간 return 해주면 됨.
visited가 있으면 좋지만, bfs만으로 풀기 위해서는 없어야 함.
각 레벨의 노드(단어)마다 방문한게 달라서.
words의 최대 길이가 50이라 visited 없어도 시간상 괜찮
*/
func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target) else { return 0 }
    
    var queue = [(curWord: String, level: Int)]()
    queue.append((begin, 0))
    
    var queueIdx = 0
    while !queue.isEmpty {
        let (curWord, curLevel) = queue[queueIdx]
        queueIdx += 1
        
        let nextWords = words.filter { isConvertable(curWord, $0) }
        for nextWord in nextWords {
            if nextWord == target {
                return curLevel + 1
            } else {
                queue.append((nextWord, curLevel + 1))
            }
        }
    }
    
    return 0
}

func isConvertable(_ myWord: String, _ target: String) -> Bool {
    let (myWord, target) = (Array(myWord), Array(target))
    var diffCount = 0
    
    for (w, t) in zip(myWord, target) {
        diffCount += w != t ? 1 : 0
    }
    
    return diffCount == 1 ? true : false
}
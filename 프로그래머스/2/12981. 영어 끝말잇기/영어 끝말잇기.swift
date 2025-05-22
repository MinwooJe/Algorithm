import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var visited = Set<String>()
    var result = [0, 0]
    
    visited.insert(words[0])
    for i in 1..<words.count {
        if words[i - 1].last! != words[i].first! || visited.contains(words[i]) {
            result = [i % n + 1, i / n + 1]
            break
        }

        visited.insert(words[i])
    }
    
    return result
}
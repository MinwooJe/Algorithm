import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var result = 0
    var queue = [(String, Int, [String])]()
    
    queue.append((begin, 0, [begin]))
    var queueIdx = 0
    while queueIdx < queue.count {
        let (cur, count, visited) = queue[queueIdx]
        queueIdx += 1
        
        if cur == target {
            result = count
            break
        }
        
        let nextWords = words.filter { 
            return isConvertable(cur, $0) && !visited.contains($0)
        }
        nextWords.forEach { queue.append(($0, count + 1, visited + [$0])) }
    }
    
    return result
}

func isConvertable(_ word: String, _ target: String) -> Bool {
    let word = Array(word)
    let target = Array(target)
    var diff = 0
    
    for (w, t) in zip(word, target) {
        if w != t {
            diff += 1
            if diff > 1 {
                return false
            }
        }
    }
    
    return true
}
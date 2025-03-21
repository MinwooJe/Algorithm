import Foundation
/**
priorities[location]이 몇 번째로 실행되는지?
*/
// location: 1-based
func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = zip((0..<priorities.count), priorities).map { (idx: $0, p: $1) }
    var result = 0
    
    // var queueIdx = 0
    while !queue.isEmpty {
        let (curIdx, curProcess) = queue.removeFirst()
        // queueIdx += 1
        
        // curProcess 보다 우선순위 높은게 있는지 확인
        var isCurrMax = true
        for (_, process) in queue {
            if curProcess < process {
                isCurrMax = false
            }
        }
        
        if isCurrMax {
            result += 1
            if curIdx == location {
                break
            } 
        } else {
            queue.append((curIdx, curProcess))
        }
        
    }
    
    return result
}
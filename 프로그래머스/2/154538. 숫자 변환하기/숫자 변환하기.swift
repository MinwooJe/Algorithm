import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var result = -1
    var queue = [(Int, Int)]()
    queue.append((y, 0))
    
    var queueIdx = 0
    while queueIdx < queue.count {
        let (cur, count) = queue[queueIdx]
        queueIdx += 1
        
        guard cur != x else { 
            result = count
            break
        }
        
        if cur - n >= x {
            queue.append((cur - n, count + 1))
        }
        if cur % 2 == 0 {
            queue.append((cur / 2, count + 1))
        }
        if cur % 3 == 0 {
            queue.append((cur / 3, count + 1))
        }
    }
    
    return result
}
import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var result = 0
    let maxCount = (queue1.count + queue2.count) * 2
    var (queue1, queue2) = (queue1, queue2)
    var (idx1, idx2) = (0, 0)
    var (sum1, sum2) = (queue1.reduce(0, +), queue2.reduce(0, +))
    
    guard (sum1 + sum2) % 2 == 0 else { return -1 }
    
    while result < maxCount {
        if sum1 < sum2 {
            let element = queue2[idx2]
            sum1 += element
            sum2 -= element
            queue1.append(element)
            idx2 += 1
        } else if sum1 > sum2 {
            let element = queue1[idx1]
            sum1 -= element
            sum2 += element
            queue2.append(queue1[idx1])
            idx1 += 1
        } else {
            return result
        }
        result += 1
    }
    
    return -1
}
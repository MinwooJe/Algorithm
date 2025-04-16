import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let maxCount = (queue1.count + queue2.count) * 2
    var (queue1, queue2) = (queue1, queue2)
    var (idx1, idx2) = (0, 0)
    var sum1 = queue1.reduce(0, +)
    var sum2 = queue2.reduce(0, +)
    var result = 0
    
    guard (sum1 + sum2) % 2 == 0 else { return -1 }
    
    while result < maxCount {
        if sum1 == sum2 {
            return result
        } else if sum1 < sum2 {
            // queue2의 원소 pop -> queue1 append
            queue1.append(queue2[idx2])
            sum1 += queue2[idx2]
            sum2 -= queue2[idx2]
            idx2 += 1
        } else {
            // queue1의 원소 pop -> queue2 append
            queue2.append(queue1[idx1])
            sum2 += queue1[idx1]
            sum1 -= queue1[idx1]
            idx1 += 1
        }
        result += 1
    }
    
    return -1
}
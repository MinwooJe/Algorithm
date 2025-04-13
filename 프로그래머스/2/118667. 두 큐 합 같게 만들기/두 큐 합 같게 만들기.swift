import Foundation

/**
주의 사항
- queue가 배열 -> pop 시 오버헤드 존재 -> 인덱스 사용
    -> 큐 길이가 매번 변함 -> while문의 조건을 위해 처음의 원소 개수 구해야 됨.
- 큐의 최대 길이 300000 -> 매번 합 계산 오버헤드 존재 -> 합을 처음에만 구하고 갱신 -> sum 변수 필요
*/
func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var (sum1, sum2) = (queue1.reduce(0, +), queue2.reduce(0, +))
    
    guard (sum1 + sum2) % 2 == 0 else { return -1 }
    
    var (queue1, queue2) = (queue1, queue2)
    let (queue1Count, queue2Count) = (queue1.count, queue2.count)
    var (idx1, idx2) = (0, 0)
    var result = 0
    
    while result < (queue1Count + queue2Count) * 2 {
        if sum1 < sum2 {
            queue1.append(queue2[idx2])
            sum1 += queue2[idx2]
            sum2 -= queue2[idx2]
            idx2 += 1
        } else if sum1 > sum2 {
            queue2.append(queue1[idx1])
            sum1 -= queue1[idx1]
            sum2 += queue1[idx1]
            idx1 += 1
        } else {
            return result
        }
        result += 1
    }
    return -1
}
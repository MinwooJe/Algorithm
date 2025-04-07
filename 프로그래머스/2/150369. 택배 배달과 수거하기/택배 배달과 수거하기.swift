import Foundation
/**
[1, 0, 3, 1, 2]
[0, 3, 0, 4, 0]

한 번 나간김에 배달, 픽업 최대한 하는게 좋음 -> 그리디하게 배달하기
가장 먼 곳 부터 배달.
*/
/// cap: 트럭 용량, n: 배달할 집의 개수, delevieries: 배달해야 될 집, pickups: 픽업할 곳
func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var d = deliveries
    var p = pickups
    var distance: Int64 = 0
    
    while let last = d.last, last == 0 {
        d.removeLast()
    }
    
    while let last = p.last, last == 0 {
        p.removeLast()
    }
    
    while !d.isEmpty || !p.isEmpty {
        distance += Int64(max(d.count, p.count)) * 2
        // 배달
        var currParcel = cap
        while !d.isEmpty {
            let lastIdx = d.count - 1
            if currParcel >= d[lastIdx] {
                currParcel -= d[lastIdx]
                d.removeLast()
            } else {
                d[lastIdx] -= currParcel
                break
            }
        }

        // 픽업
        var currCap = 0
        while !p.isEmpty {
            let lastIdx = p.count - 1
            if currCap + p[lastIdx] <= cap {
                currCap += p[lastIdx]
                p.removeLast()
            } else {
                p[lastIdx] -= (cap - currCap)
                break
            }
        }
    }
    
    return Int64(distance)
}
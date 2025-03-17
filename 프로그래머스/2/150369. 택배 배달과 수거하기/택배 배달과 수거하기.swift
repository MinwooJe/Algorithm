import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var d = deliveries
    var p = pickups
    var count = 0

    while let last = d.last, last == 0 {
        d.removeLast()
    }

    while let last = p.last, last == 0 {
        p.removeLast()
    }

    while !d.isEmpty || !p.isEmpty {
        var currDeliveryCap = cap
        var currPickupCap = 0

        count += max(d.count, p.count) * 2
        while !d.isEmpty {
            // 현재 택배가 부족해서 해당 집에게 필요한 택배 배달 불가
            if currDeliveryCap < d[d.count - 1] {
                d[d.count - 1] -= currDeliveryCap
                currDeliveryCap = 0
                break
            } else {
                currDeliveryCap -= d.removeLast()
            }
        }

        while !p.isEmpty {
            // 트럭이 꽉 차서 수거 불가능
            if currPickupCap + p.last! > cap {
                p[p.count - 1] -= cap - currPickupCap
                currPickupCap = cap
                break
            } else {
                currPickupCap += p.removeLast()
            }
        }
    }

    
    return Int64(count)
}
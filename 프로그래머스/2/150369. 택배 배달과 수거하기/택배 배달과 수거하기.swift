func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var deliveries = deliveries
    var pickups = pickups
    var answer = 0
    
    while let last = deliveries.last, last == 0 {
        deliveries.removeLast()
    }
    
    while let last = pickups.last, last == 0 {
        pickups.removeLast()
    }
    
    while !(deliveries.isEmpty && pickups.isEmpty) {
        answer += max(deliveries.count, pickups.count) * 2
        
        var currDeliveryCount = 0
        var currPickupCount = 0
        
        while !deliveries.isEmpty {
            if currDeliveryCount + deliveries.last! <= cap {
                currDeliveryCount += deliveries.removeLast()
            } else {
                deliveries[deliveries.count - 1] -= cap - currDeliveryCount
                break
            }
        }
        
        while !pickups.isEmpty {
            if currPickupCount + pickups.last! <= cap {
                currPickupCount += pickups.removeLast()
            } else {
                pickups[pickups.count - 1] -= cap - currPickupCount
                break
            }
        }
    }
    
    return Int64(answer)
}
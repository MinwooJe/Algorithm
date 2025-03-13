import Foundation

// 다리 제한사항: bridge_length 만큼, weight 이하 
// 1시간 당 1칸 움직임.
func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var waitingTruck = truck_weights
    var count = 0
    var bridgeWeight = 0
    var bridge = Array(repeating: 0, count: bridge_length)
    
    while !waitingTruck.isEmpty || bridgeWeight != 0 {
        count += 1
        bridgeWeight -= bridge.removeFirst()
        
        if !waitingTruck.isEmpty {
            let nextTruck = waitingTruck[0]
            if bridgeWeight + nextTruck <= weight {
                bridgeWeight += nextTruck
                bridge.append(nextTruck)
                waitingTruck.removeFirst()
            } else {
                bridge.append(0)
            }
        }
    }

    return count
}
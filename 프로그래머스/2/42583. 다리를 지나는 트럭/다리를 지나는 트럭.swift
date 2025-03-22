import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var waitingTrucks = truck_weights
    var bridgeWeight = 0
    var bridge = Array(repeating: 0, count: bridge_length)
    var count = 0
    
    while !waitingTrucks.isEmpty || bridgeWeight > 0 {
        count += 1
        bridgeWeight -= bridge.removeFirst()
        
        if !waitingTrucks.isEmpty && bridgeWeight + waitingTrucks[0] <= weight {
            let newTruck = waitingTrucks.removeFirst()
            bridgeWeight += newTruck
            bridge.append(newTruck)
        } else {
            bridge.append(0)
        }
    }
    
    return count
}
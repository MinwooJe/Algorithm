import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridge = Array(repeating: 0, count: bridge_length)
    var result = 0
    var waitingTrucks = truck_weights
    var currWeight = 0
    
    while !waitingTrucks.isEmpty || currWeight != 0  {
        result += 1
        currWeight -= bridge.removeFirst()
        if !waitingTrucks.isEmpty && waitingTrucks[0] + currWeight <= weight {
            let newTruck = waitingTrucks.removeFirst()
            bridge.append(newTruck)
            currWeight += newTruck
        } else {
            bridge.append(0)
        }
    }
    
    return result
}
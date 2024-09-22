import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var challengers = Dictionary(uniqueKeysWithValues: (1...N+1).map { ($0, 0) })
    var failRateDict = [Int: Double]()
    
    stages.forEach { challengers[$0]! += 1 }
    
    var total = stages.count
    for i in 1...N {
        failRateDict[i] = Double(challengers[i]!) / Double(total)
        total -= challengers[i]!
    }
    
    return failRateDict
        .sorted { $0.key < $1.key }
        .sorted { $0.value > $1.value }
        .map { $0.key }
}

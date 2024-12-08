import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var challengers = [Int: Int]()
    var failRateDict = [Int: Double]()
    var reachers = stages.count
    
    for stage in stages {
        challengers[stage, default: 0] += 1
    }
    
    for i in 1...N {
        let failRate = Double(challengers[i, default: 0]) / Double(reachers)
        failRateDict[i] = failRate
        reachers -= challengers[i, default: 0]
    }
    
    return failRateDict
                    .sorted { $0.key < $1.key}
                    .sorted { $0.value > $1.value }
                    .map { $0.key }
}
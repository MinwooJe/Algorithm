import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var challenger = Array(repeating: 0, count: N + 1)
    var failRateDict = [Int: Double]()
    var total = stages.count
    
    stages.forEach { challenger[$0 - 1] += 1 }
    
    for i in 1...N {
        failRateDict[i] = Double(challenger[i - 1]) / Double(total)
        total -= challenger[i - 1]
    }

    return failRateDict
    .sorted { $0.key < $1.key }
    .sorted { $0.value > $1.value}
    .map { $0.key }
}
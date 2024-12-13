import Foundation

func solution(_ n:Int) -> Int {
    let end = Int(sqrt(Double(n))) + 1
    var isPrime = Array(repeating: true, count: n + 1)
    (isPrime[0], isPrime[1]) = (false, false)
    
    for i in 2...end {
        for j in stride(from: i + i, to: n + 1, by: i) {
            isPrime[j] = false
        }
    }

    return isPrime.filter { $0 == true }.count
    
}
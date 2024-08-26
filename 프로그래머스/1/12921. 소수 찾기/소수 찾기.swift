import Foundation

func solution(_ n:Int) -> Int {
    var count = 0
    for i in 2...n {
        if isPrime(i) {
            count += 1
        }
    }
    
    return count
}

func isPrime(_ n: Int) -> Bool {
    let sqrtN = Int(sqrt(Double(n)))
    for i in 1...sqrtN {
        if i == 1 { continue }
        if n % i == 0 {
            return false
        }
    }
    return true
}
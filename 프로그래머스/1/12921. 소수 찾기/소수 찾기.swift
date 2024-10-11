import Foundation

func solution(_ n:Int) -> Int {
    var result = 0
    
    for i in 2...n {
        result += isPrime(i) ? 1 : 0
    }
    
    return result
}

func isPrime(_ n: Int) -> Bool {
    guard n > 3 else { return true }
    let end = Int(sqrt(Double(n)))
    
    for i in 2...end {
        if n % i == 0 {
            return false
        }
    }
    return true
}
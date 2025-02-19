import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    return String(n, radix: k)
        .split(separator: "0")
        .filter { isPrime(Int($0)!) }
        .count
}

func isPrime(_ n: Int) -> Bool {
    guard n >= 2 else { return false }

    let end = Int(sqrt(Double(n))) + 1
    var result = true

    for i in 2..<end {
        if n % i == 0 {
            result = false
            break
        }
    }
    
    return result
}
import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let targets = Array(String(n, radix: k).split(separator: "0"))
    return targets.filter { isPrime(Int($0)!) }.count
}

func isPrime(_ num: Int) -> Bool {
    guard num != 1 else { return false }
    let end = Int(sqrt(Double(num))) + 1
    
    for i in 2..<end {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}
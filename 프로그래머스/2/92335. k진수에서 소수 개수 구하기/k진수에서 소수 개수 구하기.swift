import Foundation
// 조건에 맞는 수들 중 소수 찾기
// 조건: 0 기준 split
    // 소수 판별
func solution(_ n:Int, _ k:Int) -> Int {
    let arr = String(n, radix: k).split(separator: "0")
    return arr.filter { isPrime(Int($0)!) }.count
}

func isPrime(_ num: Int) -> Bool {
    guard num > 1 else { return false }

    let end = Int(sqrt(Double(num))) + 1
    
    for i in 2..<end {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}
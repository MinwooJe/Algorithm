import Foundation

func solution(_ n:Int64) -> Int64 {
    for i in 1...Int(sqrt(Double(n))) {
        if i * i == n {
            return Int64((i + 1) * (i + 1))
        }
    }
    return -1
}
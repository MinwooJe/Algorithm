import Foundation

func solution(_ n:Int) -> Int {
    if n == 0 { return 0 }
    return Array(1...n).filter { return n % $0 == 0 }.reduce(0, +)
}

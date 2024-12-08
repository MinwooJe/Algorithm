import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let cost = (1...count).map { $0 * price }.reduce(0, +)
    return money >= cost ? 0 : Int64(cost - money)
}
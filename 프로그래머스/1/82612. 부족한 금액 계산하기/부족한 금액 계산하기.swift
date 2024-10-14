import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64 {
    var money = money
    
    for i in 1...count {
        money -= i * price
    }
    
    return money >= 0 ? 0 : Int64(-money)
}
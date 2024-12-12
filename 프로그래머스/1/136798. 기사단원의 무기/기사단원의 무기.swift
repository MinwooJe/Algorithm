import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    return (1...number)
    .map {
        let attackPower = getDivisorCount($0)
        return attackPower > limit ? power : attackPower
    }.reduce(0, +)
}

func getDivisorCount(_ number: Int) -> Int {
    let end = Int(sqrt(Double(number)))
    var count = 0
    
    for i in 1...end {
        if number % i == 0 {
            count += i * i == number ? 1 : 2
        }
    }
    
    return count
}
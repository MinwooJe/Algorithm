import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    return (1...number)
        .map { return numberOfDivisor(for: $0) > limit ? power : numberOfDivisor(for: $0) }
        .reduce(0, +)
}

func numberOfDivisor(for number: Int) -> Int {
    let end = Int(sqrt(Double(number)))
    var count = 0
    
    for d in 1...end {
        if number % d == 0 {
            count += d * d == number ? 1 : 2
        }
    }
    
    return count
}
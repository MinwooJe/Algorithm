func solution(_ n:Int) -> Int {
    return getDivisor(n).reduce(0, +)
}

func getDivisor(_ n: Int) -> [Int] {
    guard n != 0 else { return [0] }
    
    var divisor = [Int]()
    
    for i in 1...n {
        if n % i == 0 {
            divisor.append(i)
        }
    }
    
    return divisor
}
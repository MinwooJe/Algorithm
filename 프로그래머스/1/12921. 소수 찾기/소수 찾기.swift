import Foundation

func solution(_ n:Int) -> Int {
    var numbers = Array(repeating: true, count: n + 1)
    let end = Int(sqrt(Double(n)))
    (numbers[0], numbers[1]) = (false, false)
    
    for i in 1...end {
        if numbers[i] == false {
            continue
        }
        
        for j in stride(from: i + i, to: n + 1, by: i) {
            numbers[j] = false
        }
    }
    
    return numbers.filter { $0 == true }.count
}
import Foundation

func solution(_ n:Int) -> Int {
    guard n != 0 else { return 0 }
    var result = 0
    let sqrtN = Int(sqrt(Double(n)))
    
    for i in 1...sqrtN {
        if n % i == 0 {
            if i * i == n {
                result += i
            } else {
                result += i
                result += n / i
            }
        }
    }
    
    return result
}

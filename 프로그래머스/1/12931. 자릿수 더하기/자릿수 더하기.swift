import Foundation

func solution(_ n:Int) -> Int {
    var n = n
    var result = 0

    while n > 0 {
        result += n % 10
        n = n / 10
    }
    
    return result
}
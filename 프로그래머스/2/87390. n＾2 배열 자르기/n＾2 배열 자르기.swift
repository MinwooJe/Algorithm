import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var result = [Int]()

    for num in Int(left)...Int(right) {
        let row = num / n
        let col = num % n
        result.append(max(row, col) + 1)
    }

    return result
}
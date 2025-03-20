import Foundation
/**
격자의 수 == 넓이
직사각형의 넓이의 약수 짝 -> 가로, 세로
(y_w + y_h) * 2 + 4(= 모서리 네 개) == brown의 넓이
*/
func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let pairOfDivisors = getPairOfDivisors(yellow)
    var result = [Int]()
    
    for (w, h) in pairOfDivisors {
        if (w + h) * 2 + 4 == brown {
            result = [w + 2, h + 2]
        }
    }
    
    return result
}

func getPairOfDivisors(_ num: Int) -> [(w: Int, h: Int)] {
    let end = Int(sqrt(Double(num)))
    var result = [(Int, Int)]()
    
    for i in 1...end {
        if num % i == 0 {
            result.append((num / i, i))
        }
    }
    
    return result
}
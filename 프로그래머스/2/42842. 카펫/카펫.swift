import Foundation
/**
노란색이 한줄인경우와 아닌 경우
1) 노란색이 한 줄인 경우: 노란색 * 2 + 6 == 갈색
return [노란색 + 2, 3]
2) 아닌 경우:
return []
*/
func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var result = [0, 0]
    // 노란색이 한 줄인 경우
    if yellow * 2 + 6 == brown {
        result =  [yellow + 2, 3]
    } else {
        let divisors = getPairOfDivisor(yellow)
        for (h, w) in divisors {
            // 올바른 카펫 모양인 경우
            if (w + h) * 2 + 4 == brown {
                result =  [w + 2, h + 2]
            }
        }
    }

    return result
}

func getPairOfDivisor(_ n: Int) -> [(Int, Int)] {
    var result = [(Int, Int)]()
    
    let end = Int(sqrt(Double(n)))
    
    for i in 1...end {
        if n % i == 0 {
            result.append((i, n / i))
        }
    }
    
    return result
}
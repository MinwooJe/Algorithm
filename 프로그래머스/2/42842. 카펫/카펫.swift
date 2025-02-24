import Foundation

// yellow의 개수는 넓이를 의미.
// 이 문제는 카펫의 가로 세로 길이를 구해야되고, 각 구역은 직사각형이니
// yellow의 약수가 결국 가로, 세로 길이의 후보들.
// 얘네로 올바른 넓이를 만들 수 있는지 확인하면 됨.
func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var result = [0, 0]
    if yellow * 2 + 6 == brown {    // 노란색이 한 줄일 경우
        result = [yellow + 2, 3]
    } else {
        let pairOfDivisors = getPairOfDivisors(yellow)
        for (w, h) in pairOfDivisors {
            if (w + h) * 2 + 4 == brown {   // 올바른 카펫 모양일 경우
                result = [w + 2, h + 2]
                break
            }
        }
    }
    
    return result
}

/// return value: [(width, height)]
func getPairOfDivisors(_ yellow: Int) -> [(Int, Int)] {
    let end = Int(sqrt(Double(yellow)))
    var result = [(Int, Int)]()
    
    for i in 1...end {
        if yellow % i == 0 {
            result.append((yellow / i, i))
        }
    }
    
    return result
}
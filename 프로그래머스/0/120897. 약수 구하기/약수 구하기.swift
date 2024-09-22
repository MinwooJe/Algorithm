import Foundation

func solution(_ n:Int) -> [Int] {
    var answer = [Int]()
    let end = Int(sqrt(Double(n)))
    
    for i in 1...end {
        if n % i == 0 {
            if i * i == n { // 제곱수일 때
                answer.append(i)
            } else {
                answer.append(i)
                answer.append(n / i)
            }
        }
    }
    return answer.sorted()
}
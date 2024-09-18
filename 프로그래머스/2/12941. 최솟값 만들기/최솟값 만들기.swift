import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    var ans = 0
    
    let A = A.sorted()
    let B = B.sorted(by: >)
    
    for (a, b) in zip(A, B) {
        ans += a * b
    }
    
    return ans
}
import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var left = 1
    var right = 200000000
    
    while left <= right {
        var contiZeroCount = 0
        let mid = (left + right) / 2

        for i in 0..<stones.count {
            if stones[i] - mid <= 0 {
                contiZeroCount += 1
            } else {
                contiZeroCount = 0
            }
            
            if contiZeroCount >= k {
                break
            }
        }
        if contiZeroCount >= k {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return left
}
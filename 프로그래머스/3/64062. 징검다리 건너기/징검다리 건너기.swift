import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var result = 0
    var (l, r) = (0, 200000000)

    while l <= r {
        let mid = (l + r) / 2
        var contiZeroCount = 0
        
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
        
        if contiZeroCount > k {
            r = mid - 1
        } else if contiZeroCount < k {
            l = mid + 1
        } else {
            result = mid
            r = mid - 1
        }
    }
    
    return result
}
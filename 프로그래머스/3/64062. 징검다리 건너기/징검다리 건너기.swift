import Foundation

/// k: 건너 뛸 수 있는 최대 -> 0인 징검다리가 k개면 못건넘.
func solution(_ stones:[Int], _ k:Int) -> Int {
    var result = 0
    var (l, r) = (0, 200000000)
    
    // var num = 200000000
    // while num >= 1 {
    //     print(num)
    //     num /= 2
    // }
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
            // contiZeroCount == k라는 말은, 딱 얘네까지 건널 수 있고 이후에는 못건넌다는 말.
            result = mid
            r = mid - 1
        }
    }
    
    return result
}
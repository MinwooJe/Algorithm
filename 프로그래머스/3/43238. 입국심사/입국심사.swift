import Foundation
/**
입력값이 너무 큰데..? 근데 최적의 시간을 찾아야 하네..?
-> 이분 탐색!
*/
// n: 입국 심사를 기다리는 사람 수, times: 각 심사관이 한 명을 심사하는데 걸리는 시간
func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var (l, r) = (1, times.max()! * n)
    var result = 0

    while l <= r {
        let mid = (l + r) / 2
        var people = 0

        for time in times {
            people += mid / time

            // 사람이 많다 -> 시간이 너무 충분 할 수도
            if people > n {
                result = mid
                r = mid - 1
                break
            }
        }

        // 처리한 사람이 적다 -> 시간이 적음
        if people < n {
            l = mid + 1
        } else if people == n {
            r = mid - 1
            result = mid
        }
    }
    
    return Int64(result)
}
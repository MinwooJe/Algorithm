import Foundation

/**
k 칸 점프 -> k 만큼 건전지 사용.
순간이동: 현재까지 온 거리 * 2 -> 공짜
*/

func solution(_ n:Int) -> Int {
    var position = n
    var result = 0

    while position > 0 {
        if position % 2 == 0 {
            position /= 2
        } else {
            position -= 1
            result += 1
        }
    }
    
    return result
}
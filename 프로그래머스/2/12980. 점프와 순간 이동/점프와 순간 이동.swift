import Foundation
/**
순간이동: 건전지 사용량 x
k칸 점프: k만큼 건전지 사용

무조건 순간이동을 하는게 좋음.
그런데 1부터 2를 곱해서 n까지 될 수 있냐 없냐는 판단하기 어려우므로 반대로 생각
n을 2로 나누고, 홀수면 1을 뺌(점프)
*/
func solution(_ n:Int) -> Int {
    var n = n
    var answer = 1
    
    while n != 1 {
        if n % 2 == 0 {
            n /= 2
        } else {
            n -= 1
            answer += 1
        }
    }
    
    return answer
}
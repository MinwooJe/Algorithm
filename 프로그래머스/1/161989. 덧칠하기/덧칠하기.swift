import Foundation

// n: 벽의 개수, m: 롤러의 길이
// 출력: 페인트 칠 횟수
func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var result = 0
    var beforePaintedWall = 0
    
    for currentWall in section {
        if beforePaintedWall >= currentWall {
            continue
        }
        
        result += 1
        beforePaintedWall = currentWall + m - 1
    }
    
    return result
}
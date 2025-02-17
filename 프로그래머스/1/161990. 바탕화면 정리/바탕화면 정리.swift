import Foundation

/**
빈칸: ., 파일: #
*/
func solution(_ wallpaper:[String]) -> [Int] {
    let wallpaper = wallpaper.map { Array($0) }
    var (lux, luy) = (Int.max, Int.max)     // 최소값 찾아야 됨.
    var (rdx, rdy) = (Int.min, Int.min)     // 최댓값 찾아야 함.
    
    for row in 0..<wallpaper.count {
        for col in 0..<wallpaper[0].count {
            if wallpaper[row][col] == "#" {
                lux = min(lux, row)
                luy = min(luy, col)
                rdx = max(rdx, row + 1)
                rdy = max(rdy, col + 1)
            }
        }
    }

    return [lux, luy, rdx, rdy]
}
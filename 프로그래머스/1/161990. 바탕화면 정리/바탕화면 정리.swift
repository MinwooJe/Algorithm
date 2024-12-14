import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    let wallpaper = wallpaper.map { Array($0) }
    // 위, 왼쪽 -> 최솟값, 아래, 오른쪽 -> 최댓값
    // 위: 행의 최솟값, 왼쪽: 열의 최솟값
        // #의 row, col 구하면 됨.
    // 아래: 행의 최댓값, 오른쪽: 열의 최댓값
        // #의 row + 1, col + 1 구하면 됨.
    // lux: 행의 최솟값, luy: 열의 최솟값, rdx: 행의 최댓값 + 1, rdy: 열의 최댓값 + 1
    let MAX = max(wallpaper.count, wallpaper[0].count)
    var (lux, luy, rdx, rdy) = (MAX, MAX, 0, 0)

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
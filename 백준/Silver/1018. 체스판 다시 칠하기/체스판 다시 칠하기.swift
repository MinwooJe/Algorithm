import Foundation

let nm = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var wholeBoard = [[Character]]()
for _ in 0..<n {
    let input = readLine()!
    wholeBoard.append(Array(input))
}

let whiteFirst = (0..<8).map { $0 % 2 == 0 ? Array("WBWBWBWB") : Array("BWBWBWBW") }
let blackFirst = (0..<8).map { $0 % 2 == 0 ? Array("BWBWBWBW") : Array("WBWBWBWB") }

var result = Int.max

// 8x8 자른 보드 만들기
for row in 0...(n - 8) {
    for col in 0...(m - 8) {
        var (whiteCount, blackCount) = (0, 0)
        
        // 고쳐야 할 칸의 최소 개수 구하기
        for r in row..<(row + 8) {
            for c in col..<(col + 8) {
                if wholeBoard[r][c] == whiteFirst[r - row][c - col] {
                    whiteCount += 1
                }
                if wholeBoard[r][c] == blackFirst[r - row][c - col] {
                    blackCount += 1
                }
            }
        }
        
        result = min(result, whiteCount, blackCount)
    }
}


print(result)

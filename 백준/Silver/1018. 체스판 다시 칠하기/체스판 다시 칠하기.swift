import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

var wholeBoard = [[Character]]()
for _ in 0..<n {
    let line = readLine()!
    wholeBoard.append(Array(line))
}

var whiteFirstBoard = (0..<8).map { $0 % 2 == 0 ? Array("WBWBWBWB") : Array("BWBWBWBW") }
var blackFirstBoard = (0..<8).map { $0 % 2 == 0 ? Array("BWBWBWBW") : Array("WBWBWBWB") }

var result = Int.max
for rowStart in 0...(n - 8) {
    for colStart in 0...(m - 8) {
        var whiteCount = 0
        var blackCount = 0
        for row in rowStart..<(8 + rowStart) {
            for col in colStart..<(8 + colStart) {
                if wholeBoard[row][col] != whiteFirstBoard[row - rowStart][col - colStart] {
                    whiteCount += 1
                }
                if wholeBoard[row][col] != blackFirstBoard[row - rowStart][col - colStart] {
                    blackCount += 1
                }
            }
        }
        result = min(result, whiteCount, blackCount)
    }
}

print(result)

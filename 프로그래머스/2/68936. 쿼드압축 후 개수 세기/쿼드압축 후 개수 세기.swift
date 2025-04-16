import Foundation

var (zeroCount, oneCount) = (0, 0)

func solution(_ arr:[[Int]]) -> [Int] {
    recursive(arr, 0, 0, arr.count)
    return [zeroCount, oneCount]
}

/// row, col: 시작 행, 열 인덱스, n: 탐색할 정사각형 한 변의 길이
func recursive(_ arr: [[Int]], _ row: Int, _ col: Int, _ n: Int) {
    let element = arr[row][col]
    
    for r in row..<row + n {
        for c in col..<col + n {
            if arr[r][c] != element {
                // 재귀 호출 - 4등분
                recursive(arr, row, col, n / 2)
                recursive(arr, row + n / 2, col, n / 2)
                recursive(arr, row, col + n / 2, n / 2)
                recursive(arr, row + n / 2, col + n / 2, n / 2)
                return
            }
        }
    }
    
    // 해당 구역(재귀 함수의 탐색 범위)이 모두 같은 수라면 더 이상 볼 필요 없음.
    if element == 1 {
        oneCount += 1
    } else {
        zeroCount += 1
    }
    
}
import Foundation

var (zeroCount, oneCount) = (0, 0)

func solution(_ arr:[[Int]]) -> [Int] {
    recursive(arr, 0, 0, arr.count)

    return [zeroCount, oneCount]
}

// 압축 안되는 놈들만 파고 들어가기
/// 매개변수로 시작점을 받고
func recursive(_ arr: [[Int]], _ row: Int, _ col: Int, _ n: Int) {
    let element = arr[row][col]
    
    // 반복문에서 끝지점을 만들기
    for r in row..<row + n {
        for c in col..<col + n {
            if arr[r][c] != element {
                recursive(arr, row, col, n / 2)
                recursive(arr, row + n / 2, col, n / 2)
                recursive(arr, row, col + n / 2, n / 2)
                recursive(arr, row + n / 2, col + n / 2, n / 2)
                
                return
            }
        }
    }
    
    if element == 1 {
        oneCount += 1
    } else {
        zeroCount += 1
    }
}
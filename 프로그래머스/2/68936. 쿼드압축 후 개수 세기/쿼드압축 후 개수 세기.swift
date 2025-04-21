import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    var (zeroCount, oneCount) = (0, 0)

    func bruteforce(_ arr: [[Int]], _ startRow: Int, _ startCol: Int, _ length: Int) {
        let element = arr[startRow][startCol]

        for row in startRow..<startRow + length {
            for col in startCol..<startCol + length {
                if arr[row][col] != element {
                    bruteforce(arr, startRow, startCol, length / 2)
                    bruteforce(arr, startRow, startCol + length / 2, length / 2)
                    bruteforce(arr, startRow + length / 2, startCol, length / 2)
                    bruteforce(arr, startRow + length / 2, startCol + length / 2, length / 2)
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
    
    bruteforce(arr, 0, 0, arr.count)
    return [zeroCount, oneCount]
}
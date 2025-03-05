import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    let rowCount = arr1.count
    let colCount = arr2[0].count
    var result = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    
    for rowIdx in 0..<rowCount {
        for colIdx in 0..<colCount {
            var sum = 0
            for i in 0..<arr2.count {
                sum += arr1[rowIdx][i] * arr2[i][colIdx]
            }
            result[rowIdx][colIdx] = sum
        }
    }
    
    return result
}
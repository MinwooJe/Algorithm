import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    let rowCount = arr1.count
    let colCount = arr2[0].count
    var result = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    
    for i in 0..<rowCount {
        for j in 0..<colCount {
            var tempSum = 0
            for k in 0..<arr2.count {
                tempSum += arr1[i][k] * arr2[k][j]
            }
            result[i][j] = tempSum
        }
    }

    
    return result
}

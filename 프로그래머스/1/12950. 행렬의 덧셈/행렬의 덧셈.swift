func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    let rowCount = arr1.count
    let colCount = arr1[0].count
    var result = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    for i in 0..<rowCount {
        for j in 0..<colCount {
            result[i][j] = arr1[i][j] + arr2[i][j]
        }
    }
    return result
}
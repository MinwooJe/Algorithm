func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    let rowCount = arr1.count
    let colCount = arr1[0].count
    var result = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    
    for row in 0..<rowCount {
        for col in 0..<colCount {
            result[row][col] = arr1[row][col] + arr2[row][col]
        }
    }
    
    return result
}
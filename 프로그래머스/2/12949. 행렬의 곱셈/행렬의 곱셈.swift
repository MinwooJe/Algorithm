import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = [[Int]]()
    
    for r in 0..<arr1.count {
        var tempArr = [Int]()
        for c in 0..<arr2[0].count {
            var tempSum = 0
            for i in 0..<arr2.count {
                tempSum += arr1[r][i] * arr2[i][c]
            }
            tempArr.append(tempSum)
        }
        result.append(tempArr)
    }
    
    return result
}
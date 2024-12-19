import Foundation

func solution(_ s:String) -> [Int] {
    var result = [Int]()
    var appearedCharIdxDict = [Character: Int]()
    
    for (idx, value) in s.enumerated() {
        if appearedCharIdxDict[value] == nil {
            appearedCharIdxDict[value] = idx
            result.append(-1)
        } else {
            let idxDelta = idx - appearedCharIdxDict[value, default: 0]
            result.append(idxDelta)
            appearedCharIdxDict[value] = idx
        }
    }
    
    return result
}
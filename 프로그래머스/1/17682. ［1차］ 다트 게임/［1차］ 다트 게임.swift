import Foundation

func solution(_ dartResult:String) -> Int {
    let dartResult = dartResult.replacingOccurrences(of: "10", with: "x")
    var result = [Int]()
    
    for c in dartResult {
        let lastIndex = result.count - 1
        switch c {
        case "S":
            continue
        case "D":
            result[lastIndex] = result[lastIndex] * result[lastIndex]
        case "T":
            result[lastIndex] = result[lastIndex] * result[lastIndex] * result[lastIndex]
        case "*":
            if result.count >= 2 {
                result[lastIndex] *= 2
                result[lastIndex - 1] *= 2
            } else {
                result[lastIndex] *= 2
            }
        case "#":
            result[lastIndex] *= -1
        case "x":
            result.append(10)
        default:
            result.append(Int(String(c))!)
        }
    }
    return result.reduce(0, +)
}
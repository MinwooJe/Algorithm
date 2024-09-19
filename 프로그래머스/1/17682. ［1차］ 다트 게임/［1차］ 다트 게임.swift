import Foundation

func solution(_ dartResult:String) -> Int {
    var points = [Int]()
    let dartResult = dartResult.replacingOccurrences(of: "10", with: "x")
    for c in dartResult {
        let lastIndex = points.count - 1
        
        if c.isNumber {
            points.append(Int(String(c))!)
        } else if c == "x" {
            points.append(10)
        } else {
            switch c {
            case "S":
                continue
            case "D":
                points[lastIndex] = points[lastIndex] * points[lastIndex]
            case "T":
                points[lastIndex] = points[lastIndex] * points[lastIndex] * points[lastIndex]
            case "*":
                points[lastIndex] = points[lastIndex] * 2
                if lastIndex - 1 >= 0 {
                    points[lastIndex - 1] = points[lastIndex - 1] * 2
                }
            case "#":
                points[lastIndex] = points[lastIndex] * -1
            default:
                break
            }
        }
    }
    return points.reduce(0, +)
}

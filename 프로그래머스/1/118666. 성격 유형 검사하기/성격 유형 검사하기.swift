import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    let pointDict = makePointDict(survey, choices)
    let result = sortedResult(pointDict)
    return result
}

func makePointDict(_ survey:[String], _ choices:[Int]) -> [String: Int] {
    var pointDict = [String: Int]()
    
    for (s, c) in zip(survey, choices) {
        let components = s.map( { String($0) })
        let (first, second) = (components[0], components[1])

        if c > 4 {
            pointDict[second, default: 0] += c - 4
        } else if c < 4 {
            pointDict[first, default: 0] += 4 - c
        }
    }
    
    return pointDict
}

func sortedResult(_ pointDict: [String: Int]) -> String {
    var result = ""
    
    result += pointDict["R", default: 0] >= pointDict["T", default: 0] ? "R" : "T"
    result += pointDict["C", default: 0] >= pointDict["F", default: 0] ? "C" : "F"
    result += pointDict["J", default: 0] >= pointDict["M", default: 0] ? "J" : "M"
    result += pointDict["A", default: 0] >= pointDict["N", default: 0] ? "A" : "N"

    return result
}
import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var wantDict = Dictionary(uniqueKeysWithValues: zip(want, number))
    var result = 0
    
    for startIdx in 0...discount.count - 10 {
        var marketDict = [String: Int]()

        for i in startIdx..<startIdx + 10 {
            marketDict[discount[i], default: 0] += 1
        }

        result += wantDict == marketDict ? 1 : 0
    }
    
    return result
}
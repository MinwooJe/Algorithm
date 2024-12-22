import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothesCountDict = [String: Int]()
    var result = 1

    for clothe in clothes {
        clothesCountDict[clothe[1], default: 0] += 1
    }
    
    for count in clothesCountDict.values {
        result *= (count + 1)
    }
    
    return result - 1
}
import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothesHash = [String: Int]()
    var result = 1
    
    for clothe in clothes {
        clothesHash[clothe[1], default: 0] += 1
    }
    
    for k in clothesHash.values {
        result *= (k + 1)
    }
    
    return result - 1
}
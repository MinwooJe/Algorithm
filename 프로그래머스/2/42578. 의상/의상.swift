import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothesHash = [String: Int]()
    var result = 1

    for cloth in clothes {
        clothesHash[cloth[1], default: 0] += 1
    }
    
    for count in clothesHash.values {
        result *= (count + 1)
    }

    return result - 1
}
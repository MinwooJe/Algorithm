import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var kindOfClothes = [String: Int]()
    
    for arr in clothes {
        kindOfClothes[arr[1], default: 0] += 1
    }
    
    return kindOfClothes.values.reduce(1) { $0 * ($1 + 1) } - 1
}
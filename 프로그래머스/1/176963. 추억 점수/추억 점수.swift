import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photos:[[String]]) -> [Int] {
    var result = [Int]()
    var yearningDict = Dictionary(uniqueKeysWithValues: zip(name, yearning))

    for photo in photos {
        var score = 0
        for people in photo {
            score += yearningDict[people, default: 0]
        }
        result.append(score)
    }
    return result
}
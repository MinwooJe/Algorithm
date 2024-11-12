import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var result = 0
    let wantHash = Dictionary(uniqueKeysWithValues: zip(want, number))
    
    for i in 0...discount.count - 10 {
        var tenDaysProductHash = [String: Int]()
        for j in i..<i + 10 {
            tenDaysProductHash[discount[j], default: 0] += 1
        }
        if tenDaysProductHash == wantHash {
            print(i)
        }
        result += tenDaysProductHash == wantHash ? 1 : 0
    }
    return result
}
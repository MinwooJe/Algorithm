import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var yearningDict = Dictionary(uniqueKeysWithValues: zip(name, yearning))
    return photo.map{ $0.map{ yearningDict[$0, default: 0] }.reduce(0, +) }
}
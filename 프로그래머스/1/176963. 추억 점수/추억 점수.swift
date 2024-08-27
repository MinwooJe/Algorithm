import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    let yearningDict = Dictionary(uniqueKeysWithValues: zip(name, yearning))
    return photo.map { $0.reduce(0) { $0 + (yearningDict[$1] ?? 0) } }
}
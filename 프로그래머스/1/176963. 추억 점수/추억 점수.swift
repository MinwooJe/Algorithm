import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photos:[[String]]) -> [Int] {
    let yearningDict = Dictionary(uniqueKeysWithValues: zip(name, yearning))
    return photos.map{ $0.map { yearningDict[$0, default: 0] }.reduce(0, +) }
}

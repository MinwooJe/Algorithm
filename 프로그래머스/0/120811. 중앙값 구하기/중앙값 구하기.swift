import Foundation

func solution(_ array:[Int]) -> Int {
    var array = array.sorted()
    return array[array.count / 2]
}
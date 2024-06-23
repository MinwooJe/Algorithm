import Foundation

func solution(_ array:[Int]) -> Int {
    var sorted_array = array.sorted()
    return sorted_array[array.count / 2]
}
import Foundation

func solution(_ my_string:String, _ target:String) -> Int {
    if my_string.contains(target) {
        return 1
    } else {
        return 0
    }
}
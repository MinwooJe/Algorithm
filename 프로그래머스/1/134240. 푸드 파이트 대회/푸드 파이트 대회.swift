import Foundation

func solution(_ food:[Int]) -> String {
    var result = ""
    
    for (idx, value) in food.enumerated() {
        guard idx != 0 else { continue }
        result += String(repeating: String(idx), count: value / 2)
    }
    
    return result + "0" + result.sorted(by: >)
}
import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var result = [Int]()
    var termsDict = [String: Int]()
    
    for term in terms {
        let components = term.components(separatedBy: " ")
        termsDict[components[0]] = Int(components[1])! * 28
    }
    
    for i in 0..<privacies.count {
        let components = privacies[i].components(separatedBy: " ")
        let dueDate = parseToDay(for: components[0]) + termsDict[components[1]]!
        if dueDate <= parseToDay(for: today) {
            result.append(i + 1)
        }
    }
    
    return result
}

// 0년 0월 1일 == 1
func parseToDay(for date: String) -> Int {
    let components = date.components(separatedBy: ".").map { Int($0)! }
    return (components[0] * 12 * 28) + (components[1] * 28) + components[2]
}
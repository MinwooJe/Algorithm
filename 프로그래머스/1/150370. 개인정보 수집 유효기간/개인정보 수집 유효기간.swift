import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let today = parseDateToDay(today)
    var termsDict = [String: Int]()
    var result = [Int]()
    
    for term in terms {
        let components = term
        .split(separator: " ")
        .map { String($0) }
        termsDict[components[0]] = Int(components[1])!
    }
    
    for (index, privacy) in privacies.enumerated() {
        let components = privacy
        .split(separator: " ")
        .map { String($0) }
        let startDate = parseDateToDay(components[0])
        let dueDayByTerm: Int = termsDict[components[1]]! * 28
        
        if startDate + dueDayByTerm <= today {
            result.append(index + 1)
        }
    }
    return result
}

// YYYY-MM-DD나 HH-MM-SS는 숫자 하나로 바꾸는게 편함
// ex. 3시 5분 5초 -> (3*60*60 + 5*60 + 6) 초
func parseDateToDay(_ date: String) -> Int {
    let components = date
    .split(separator: ".")
    .map { Int($0)! }
    
    return components[0] * 12 * 28 + components[1] * 28 + components[2]
}

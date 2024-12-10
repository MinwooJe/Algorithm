import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let today = convertToDays(for: today)
    var termsDict = [String: Int]()
    var result = [Int]()
    
    for term in terms {
        let term = term.split(separator: " ").map { String($0) }
        termsDict[term[0]] = Int(term[1])!
    }

    for (idx, privacy) in privacies.enumerated() {
        let components = privacy.split(separator: " ").map { String($0) }
        let dueDate = convertToDays(for: components[0]) + termsDict[components[1]]! * 28
        
        if today >= dueDate {
            result.append(idx + 1)
        }
    }
    return result
}

func convertToDays(for date: String) -> Int {
    let components = date.split(separator: ".")
    let year = Int(components[0])!
    let month = Int(components[1])!
    let day = Int(components[2])!
    
    return (year * 12 * 28) + (month * 28) + day
}
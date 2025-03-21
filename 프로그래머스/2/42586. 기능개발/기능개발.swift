import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    let remainProgress = progresses.map { 100 - $0 }
    var remainDays = zip(remainProgress, speeds).map { (($0 - 1) / $1) + 1}
    var result = [Int]()
    
    while !remainDays.isEmpty {
        let todayTask = remainDays.removeFirst()
        var todayDone = 1
        
        while !remainDays.isEmpty && todayTask >= remainDays[0] {
            todayDone += 1
            remainDays.removeFirst()
        }
        result.append(todayDone)
    }
    
    return result
}
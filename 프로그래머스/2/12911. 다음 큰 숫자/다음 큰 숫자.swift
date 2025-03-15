import Foundation

func solution(_ n:Int) -> Int {
    var answer = 0
    let oneCount = String(n, radix: 2).filter { $0 == "1" }.count
    
    var candidate = n + 1
    
    while true {
        let binaryCandidate = String(candidate, radix: 2)
        if binaryCandidate.filter { $0 == "1" }.count == oneCount {
            answer = candidate
            break
        }
        candidate += 1
    }
    
    return answer
}
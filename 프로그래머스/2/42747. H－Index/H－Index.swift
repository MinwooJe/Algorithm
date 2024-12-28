
func solution(_ citations:[Int]) -> Int {
    var citations = citations.sorted(by: >)
    
    for i in 0..<citations.count {
        if i >= citations[i] {
            return i
        }
    }
    
    return citations.count
}
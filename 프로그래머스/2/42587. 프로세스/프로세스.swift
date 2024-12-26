import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var prioritiesWithIdx = [(p: Int, idx: Int)]()
    var count = 0
    
    for (idx, priority) in priorities.enumerated() {
        prioritiesWithIdx.append((priority, idx))
    }
    
    while true {
        let process = prioritiesWithIdx.removeFirst()
        
        if prioritiesWithIdx.filter { $0.p > process.p }.count > 0 {
            prioritiesWithIdx.append(process)
        } else {
            count += 1
            guard process.idx != location else { break }
        }
    }
    
    return count
}
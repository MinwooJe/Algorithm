import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result = [Int]()
    var queue = [Int]()     // 남은 작업 일자
    
    for (p, s) in zip(progresses, speeds) {
        let remain: Int
        if (100 - p) % s == 0 {
            remain = (100 - p) / s
        } else {
            remain = (100 - p) / s + 1
        }
        queue.append(remain)
    }

    while !queue.isEmpty {
        let finishedTask = queue.removeFirst()
        var finishedCount = 1
        
        while true {
            guard !queue.isEmpty else { break }
            if finishedTask >= queue[0] {
                queue.removeFirst()
                finishedCount += 1
            } else {
                break
            }
        }
        result.append(finishedCount)
    }

    return result
}
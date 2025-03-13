import Foundation

// queue.pop == 실행
func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = [(Int, Int)]()  // (프로세스 인덱스, 우선순위)
    var result = 0
    for i in 0..<priorities.count {
        queue.append((i, priorities[i]))
    }

    while true {
        let process = queue.removeFirst()
        if queue.filter { $0.1 > process.1 }.count > 0 {    // 우선순위 안됨.
            queue.append(process)
        } else {
            result += 1
            if process.0 == location {  // 우선순위 조건 충족 -> 실행
                break
            }
        }
    }

    return result
}
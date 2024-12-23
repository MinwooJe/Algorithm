import Foundation

// progresses: 작업의 진도 - 100이 되어야 배포, 순서는 먼재 배포해야 할 순서
// speeds: 각 작업이 개발 속도
// 각 배포마다 몇 개의기능이 배포되는지?
func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var completedDay = [Int]()
    var result = [Int]()

    for i in 0..<progresses.count {
        let day = (100 - progresses[i] - 1) / speeds[i] + 1
        completedDay.append(day)
    }

    // 하루 단위
    while !completedDay.isEmpty {
        var count = 1
        var todayTask = completedDay.removeFirst()
        // 하루 동안 배포 할 수 있는 작업 구하기
        while !completedDay.isEmpty && completedDay[0] <= todayTask {
            completedDay.removeFirst()
            count += 1
        }
        result.append(count)
    }
    
    return result
}
import Foundation
// 모든 사람의 이동 거리의 합이 최소가 되도록 하는 적절한 집 구하기.
// 출력: 가능한 이동 거리의 합 중 최소
let n = Int(readLine()!)!
let home = readLine()!.components(separatedBy: " ").map { Int($0)! }

var minDistance = 99999999999999

for targetAddress in 0..<home.count {
    var moveDistanceSum = 0
    
    for (address, numberOfPeople) in home.enumerated() {
        // 거리 * 사람 수
        moveDistanceSum += abs(targetAddress - address) * numberOfPeople
    }
    minDistance = min(minDistance, moveDistanceSum)
}

print(minDistance)

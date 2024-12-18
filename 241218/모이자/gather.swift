import Foundation
// 모든 사람의 이동 거리의 합이 최소가 되도록 하는 적절한 집 구하기.
// 출력: 가능한 이동 거리의 합 중 최소
let n = Int(readLine()!)!
let home = readLine()!.components(separatedBy: " ").map { Int($0)! }

var result = [Int]()

for target in 0..<home.count {
    var moveDistanceSum = 0
    for (address, numberOfPeople) in home.enumerated() {
        // 거리 * 사람 수
        moveDistanceSum += abs(target - address) * numberOfPeople
    }
    result.append(moveDistanceSum)
}

print(result.min()!)

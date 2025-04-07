import Foundation
/**
정수 기준 정렬 -> 10, 6, 2 -> x
문자열 기준 정렬  -> 6, 2, 10
- 문제점: 3, 30 비교 시 30 > 3으로 처리됨.
- 왜?: 길이가 다르다면 더 긴놈이 크다고 처리하기 때문
    - 길이가 짧은애가 더 유리함. 30 3보단 3 30이 더 크니
    - 짧다고 다는 아님
    - 3, 34, 30 -> 34 3 30이 젤큼
*/

func solution(_ numbers:[Int]) -> String {
    let sortedNumbers = numbers
        .map { String($0) }
        .sorted { String(repeating: $0, count: 3) > String(repeating: $1, count: 3) }
        .joined(separator: "")
    
    guard Set(sortedNumbers) != ["0"] else { return "0" }

    return sortedNumbers
}
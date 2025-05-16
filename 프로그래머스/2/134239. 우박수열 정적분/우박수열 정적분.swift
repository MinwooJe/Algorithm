import Foundation
/**
한 칸 정적분 == 사다리꼴 넓이 == (x[a] + x[b]) * 1(=높이)) / 2

1. 초항으로 우박수열 만들기
2. ranges 순회
    2.1 구간 유효성 검증: guard 시작점 < 끝점
    2.2 for 구간
        위 식으로 정적분
    2.3 결과 저장
*/
/// k: 초항, ranges: 정적분을 구하는 구간들
var sequence = [Int]()

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    var result = [Double]()
    sequence = getSequence(k)

    for range in ranges {
        let size = integral(range, sequence)
        result.append(size)
    }
    
    return result
}

func getSequence(_ k: Int) -> [Int] {
    var sequence = [k]
    var k = k
    
    while k > 1 {
        k = (k % 2 == 0) ? (k / 2) : (k * 3 + 1)
        sequence.append(k)
    }
    
    return sequence
}

func integral(_ ranges: [Int], _ sequence: [Int]) -> Double {
    let start = ranges[0]
    let end = sequence.count + ranges[1]
    var size = 0.0

    guard start < end else { return -1 }

    for i in start..<end - 1 {
        size += Double(sequence[i] + sequence[i + 1]) / Double(2)
    }

    return size
}
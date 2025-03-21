import Foundation
/**
원소의 개수가 n개이고, 중복되는 원소가 없는 튜플
부분 집합이 주어질 때 -> 튜플로 변환
1. parse -> [[Int]]
,의 종류는 두 가지 -> 중괄호 안쪽 / 중괄호 바깥쪽

2. 튜플 만들기
1) 안쪽 배열의 크기 순으로 이차원 배열 정렬
2) set, result 이용해서 결과 만들기
    - set: 중복 확인용
*/
func solution(_ s:String) -> [Int] {
    var visited = Set<Int>()
    var result = [Int]()
    let sortedSubset = parse(s)
    
    for subset in sortedSubset {
        for num in subset {
            if !visited.contains(num) {
                result.append(num)
                visited.insert(num)
            }
        }
    }
    
    return result
}

func parse(_ s: String) -> [[Int]] {
    let str = Array(s.dropFirst().dropLast().map { String($0) })
    var result = [[Int]]()

    var isInner = false
    var subset = [Int]()
    var tempNum = ""

    for s in str {
        if s == "{" {
            isInner = true      // , 구분 위해
        } else if s == "," {
            if isInner {
            subset.append(Int(tempNum)!)
            tempNum = ""
            }
        } else if s == "}" {
            subset.append(Int(tempNum)!)
            result.append(subset)
            tempNum = ""
            subset = []
            isInner = false
        } else {        // 숫자
            tempNum += s
        }
    }
    
    return result.sorted { $0.count < $1.count }
}
import Foundation
// 튜플로 부분집합을 만들 수 있는데, 부분집합이 주어졌을 때 원래의 튜플 찾기
// 튜플은 중복 원소 x, 5 <= s <= 1,000,000
/**
1. 파싱 -> 배열로 만들기
2. 배열 개수 기준 오름차순 정렬
3. set에 집어넣으면서 set에 없는것만 result에 담기
*/
func solution(_ s:String) -> [Int] {
    let sortedSubset = parse(s)
    var visited = Set<Int>()
    var result = [Int]()
    
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
    var s = Array(s.dropFirst().dropLast())
    var result = [[Int]]()
    var temp = [Int]()
    var tempNum: String = ""
    var isInner = true

    for c in s {
        if c == "{" {
            isInner = true
        } else if c.isNumber {
            tempNum += String(c)
        } else if c == "," && isInner {
            temp.append(Int(tempNum)!)
            tempNum = ""
        } else if c == "}" {
            temp.append(Int(tempNum)!)
            result.append(temp)
            temp = []
            tempNum = ""
            isInner = false
        }
    }
    
    return result.sorted { $0.count < $1.count }
}
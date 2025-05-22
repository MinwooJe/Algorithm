/**
교집합과 합집합 중 하나만 구하면 다른 하나 구할 수 있음.

1) 교집합
- 두 집합 모두 존재하는지 확인 필요.
- A, B 두 집합에서 해당 원소의 최솟값

2) 합집합
- A, B 두 집합에서 해당 원소의 최댓값
- 한 집합에서 해당 원소가 존재하지 않으면 그냥 개수

두 집합의 원소 별 개수 파악필요.
*/

/**
1. 두 글짜씩 끊기
- 영문자 외에 거르기
2. [문자: 개수] 딕셔너리 만들기
3. 합집합 또는 교집합 구하기
4. 다른 하나 구하기
5. 유사도 구하기
*/
func solution(_ str1:String, _ str2:String) -> Int {
    let str1 = parse(str1)
    let str2 = parse(str2)
    
    let intersection = getIntersection(str1, str2)
    let union = str1.count + str2.count - intersection
    
    guard union != 0 else { return 65536 }
    
    let result = Int((Double(intersection) / Double(union)) * 65536)

    return result
}

func parse(_ str: String) -> [String] {
    let str = Array(str)
    var result = [String]()
    
    for i in 0..<str.count - 1 {
        guard str[i].isLetter && str[i + 1].isLetter else { continue }
        let word = String(str[i]) + String(str[i + 1])
        result.append(word.lowercased())
    }
    
    return result
}

func getIntersection(_ str1: [String], _ str2: [String]) -> Int {
    var str1Dict = getCount(str1)
    var str2Dict = getCount(str2)
    var result = 0
    
    for word in str1Dict.keys {
        if str2Dict[word] != nil {
            result += min(str1Dict[word]!, str2Dict[word]!)
        }
    }
    
    return result
}

func getCount(_ str: [String]) -> [String: Int] {
    var result = [String: Int]()
    
    for c in str {
        result[c, default: 0] += 1
    }
    
    return result
}
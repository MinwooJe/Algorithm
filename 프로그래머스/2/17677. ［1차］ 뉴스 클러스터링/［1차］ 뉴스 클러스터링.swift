/**
자카드 유사도: 교집합 크기 / 합집합 크기
단, 집합 A, B가 공집합일 경우에는 1로 정의

다중집합일 경우 동일한 원소끼리의
교집합은 min(A(a), B(a))
합집합은 max(A(a), B(a))

1. 두 문자열이 주어질 때, 두 글자씩 끊어서 다중집합 만들기
2. 교집합 or 합집합 구하기 -> 합 = A + B - 교 이용해서 다른 하나 구하기
3. 자카드 유사도 계산하기
*/
func solution(_ str1:String, _ str2:String) -> Int {
    let str1Set = parse(from: str1)
    let str2Set = parse(from: str2)
    let str1Dict = calculateExistCount(from: str1Set)
    let str2Dict = calculateExistCount(from: str2Set)

    let intersectionSize = getIntersectionSize(str1Dict, str2Dict) 
    let unionSize = str1Set.count + str2Set.count - intersectionSize
    
    guard unionSize != 0 else { return 65536 }
    let result = Int(Double(intersectionSize) / Double(unionSize) * 65536)
    
    return result
}

func parse(from str: String) -> [String] {
    var result = [String]()
    let str = Array(str.lowercased())
    
    for i in 0..<(str.count - 1) {
        guard str[i].isLetter && str[i + 1].isLetter else { continue }
        let word = String(str[i...i + 1])
        result.append(word)
    }
    
    return result
}

func calculateExistCount(from words: [String]) -> [String: Int] {
    var result = [String: Int]()
    
    for word in words {
        result[word, default: 0] += 1
    }
    
    return result
}

func getIntersectionSize(_ A: [String: Int], _ B: [String: Int]) -> Int {
    var result = 0
    for a in A.keys {
        result += min(A[a]!, B[a, default: 0])
    }
    
    return result
}
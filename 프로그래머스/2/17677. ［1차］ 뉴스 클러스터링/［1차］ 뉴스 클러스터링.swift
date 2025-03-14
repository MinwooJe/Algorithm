// 자카드 유사도: 교집합 크기 / 합집합 크기 -> 다중집합일 때 조심하기.
// 교집합 크기, 합집합 크기를 구해야 됨.
// A U B = n(A) + n(B) - n(A \ B)
// 교집합과 합집합 중 구하기 쉬운거 구하고, 나머지는 위 식 이용해서 구하기
func solution(_ str1:String, _ str2:String) -> Int {
    let a = parse(str1)
    let b = parse(str2)
    let intersectionCount = getIntersection(a, b).count
    let unionCount = a.count + b.count - intersectionCount

    if unionCount == 0 {
        return 65536
    }
    
    return Int((intersectionCount * 65536) / unionCount)
}

func parse(_ str: String) -> [String] {
    let str = str.map { String($0) }
    var result = [String]()
    
    for i in 0..<str.count - 1 {
        guard Character(str[i]).isLetter && Character(str[i + 1]).isLetter else { continue }
        let temp =  (str[i] + str[i + 1]).uppercased()
        result.append(temp)
    }

    return result
}

func getIntersection(_ a: [String], _ b: [String]) -> [String] {
    var aDict = [String: Int]()
    var bDict = [String: Int]()
    var result = [String]()
    
    a.forEach { aDict[$0, default: 0] += 1 }
    b.forEach { bDict[$0, default: 0] += 1 }

    for key in aDict.keys {
        if bDict[key] != nil {
            let count = min(aDict[key]!, bDict[key]!)
            for _ in 0..<count {
                result.append(key)
            }
        }
    }
    
    return result
}
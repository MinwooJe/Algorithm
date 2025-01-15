func solution(_ str1:String, _ str2:String) -> Int {
    let arr1 = parseStr(str1)
    let arr2 = parseStr(str2)
    let str1Dict = convertToDict(arr1)
    let str2Dict = convertToDict(arr2)
    
    var intersection = 0
    
    for key in str1Dict.keys {
        intersection += min(str1Dict[key, default: 0], str2Dict[key, default: 0])
    }
    let union = arr1.count + arr2.count - intersection
    
    // 나눗셈이 정의되지 않는 경우
    if union == 0 {
        return 65536
    } else {
        print(intersection, union, intersection * 65536 / union)
        return Int(Double(intersection) / Double(union) * 65536)
    }
}

func parseStr(_ str: String) -> [String] {
    let str = Array(str)
    var result = [String]()
    
    for i in 0..<(str.count - 1) {
        if str[i].isLetter && str[i + 1].isLetter {
            let left = String(str[i]).lowercased()
            let right = String(str[i + 1]).lowercased()
            result.append(left + right)
        }
    }
    
    return result
}

func convertToDict(_ array: [String]) -> [String: Int] {
    var result = [String: Int]()

    for str in array {
        result[str, default: 0] += 1
    }
    
    return result
}
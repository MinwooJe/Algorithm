func solution(_ str1:String, _ str2:String) -> Int {
    let set1 = createMultipleSet(Array(str1.lowercased()).map { String($0) })
    let set2 = createMultipleSet(Array(str2.lowercased()).map { String($0) })
    
    guard set1.count + set2.count != 0 else { return 65536 }
    
    let intersectionCount = getIntersectionCount(set1, set2)
    let unionCount = set1.count + set2.count - intersectionCount
    
    let result = Int(Double(intersectionCount) / Double(unionCount) * 65536)
    return result
}

func createMultipleSet(_ str: [String]) -> [String] {
    var multipleSet = [String]()
    for i in 0..<str.count - 1 {
        let word = str[i] + str[i + 1]
        if word.allSatisfy({ $0.isLetter && $0.isASCII }) {
            multipleSet.append(word)
        }
    }
    return multipleSet
}

func getIntersectionCount(_ setA: [String], _ setB: [String]) -> Int {
    var result = 0
    var setB = setB
    
    for s in setA {
        if setB.contains(s) {
            if let index = setB.firstIndex(of: s) {
                setB.remove(at: index)
            }
            result += 1
        }
    }
    return result
}

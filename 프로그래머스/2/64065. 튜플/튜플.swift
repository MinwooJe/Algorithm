import Foundation
    /**
    1. s 파싱 -> 딕셔너리에 각 집합 담기 - 키: 원소 개수, 값: 각 집합
    2. 키 순서대로 딕셔너리 순회하면서 집합에 넣기
    3. 현재 집합 - 이전 집합 = 현재 원소 -> result 배열에 append
    */
    
    /**
    s 파싱 까다로운 점
    1. "{", ",", "}" 나오면 각각 어떤 액션?
    2. 한자리 수가 아니라면? ex) {11, 123, 1234}
    
    s 파싱의 목표
    1. 
    1.1 {{11, 123}, {123}} -> { { 1 1 , 1 2 3 } , { 1 2 3 } }
    1.2 {{4, 2, 3}, {3}, {2, 3}} -> { { 4 , 2 , 3 } , { 3 } , { 2 , 3}}
        -> [1: [123], 2: [11, 123]]
        -> [1: [3], 2: [2, 3], 3: [4, 2, 3]]
    
    var num = "" -> {} 내부의 , 나올 때 까지 num에 c 추가
    {} 내부 , 나오면 num을 tempArray에 추가
    } 나오면 tempArray를 wholeDict에 추가
    */
func solution(_ s:String) -> [Int] {
    
    var result = [Int]()
    var wholeDict = [Int: [String]]()
    var tempArray = [String]()
    var tempStr: String = ""
    var isInner = false
    
    let s = Array(s)[1..<(s.count - 1)]
    for (idx, c) in s.enumerated() {
        let c = String(c)
        if c == "{" {
            isInner = true
            continue
        }
        
        if c == "," && isInner {
            tempArray.append(tempStr)
            tempStr = ""
            continue
        } else if c == "," {
            continue
        }
        
        if c == "}" {
            tempArray.append(tempStr)
            wholeDict[tempArray.count] = tempArray
            isInner = false
            tempStr = ""
            tempArray = []
            continue
        }
        
        tempStr += c
    }
    
    var beforeSet = Set<String>()
    var currSet = Set<String>()
    
    for i in 1...wholeDict.count {
        currSet = Set(wholeDict[i]!)
        
        let diff = currSet.subtracting(beforeSet)
        
        if let element = diff.first,
           let value = Int(element) {
               result.append(value)
           }
        beforeSet = currSet
    }
    
    return result
}
import Foundation

/**
1. 정현이 딕셔너리 만들기
2. 할인 딕셔너리 만들기
- 날짜 별 할인 품목 갱신
- 정현이 딕셔너리랑 같은지 확인
*/
func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    let wantDict = Dictionary(uniqueKeysWithValues: zip(want, number))
    var discountDict = [String: Int]()
    var result = 0
    
    // discountDict 초기화
    for i in 0..<10 {
        discountDict[discount[i], default: 0] += 1
    }
    
    
    for i in 0..<discount.count - 10 {
        result += wantDict == discountDict ? 1 : 0
        discountDict[discount[i]]! -= 1
        discountDict[discount[i + 10], default: 0] += 1
        
        if discountDict[discount[i]]! == 0 {
            discountDict[discount[i]] = nil
        }
    }
    result += wantDict == discountDict ? 1 : 0
    
    return result
}
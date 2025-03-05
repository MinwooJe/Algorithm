import Foundation
/**
마트: 10일 회원 자격, 매일 한 가지 제품 할인 -> 할인 제품은 하루에 하나씩만 구매 가능.
정현: 자신이 원하는 제품과 수량이 할인하는 날짜와 10일 연속으로 일치할 경우 맞춰 회원가입 하려고 함.
반환 값: 회원등록 날짜의 총 일수, 가능한 날이 없다면 0
*/
/**
완탐해야됨. discount가 10만이라 조심. -> 완탐해도 최대 100만인데?
*/
/// want: 정현이가 원하는 상품, number: 정현이가 원하는 상품 수량, discount: 마트 할인 품목
func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var result = 0
    let wantDict = Dictionary(uniqueKeysWithValues: zip(want, number))

    for i in 0...(discount.count - 10) {
        var tempWantDict = wantDict
        for product in discount[i..<i + 10] {
            tempWantDict[product, default: 0] -= 1
        }
        
        if tempWantDict.filter { $0.value > 0 }.count <= 0 {
            result += 1
        }
    }
    
    return result
}
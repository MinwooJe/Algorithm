import Foundation

/**
엘베버튼: 절댓값이 10의 거듭제곱 (0 이상)
버튼 누르면: 현재 층 수 + 버튼 수
    0보다 작으면 움직이지 않음.

버튼 한 번당 마법의 돌 한 개

최소한 버튼 눌러 0층으로 가기

*/
func solution(_ storey:Int) -> Int {
    var storey = storey
    var result = 0
    
    while storey > 0 {
        let remainder = storey % 10
        if remainder < 5 {
            result += remainder
        } else if remainder > 5 {
            result += 10 - remainder
            storey += 10 - remainder
        } else {
            if (storey / 10) % 10 >= 5 {
                storey += 10 - remainder
                result += 10 - remainder
            } else {
                result += remainder
            }
        }
        storey /= 10
    }
    
    return result
}
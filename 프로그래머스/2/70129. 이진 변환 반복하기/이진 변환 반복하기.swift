import Foundation

func solution(_ s:String) -> [Int] {
    var result = [0, 0]         // [이진 변환 횟수, 제거된 0의 개수]
    var str = s
    
    while str.count > 1 {
        let zeroRemovedString = str.filter { $0 == "1" }
        result[0] += 1
        result[1] += str.count - zeroRemovedString.count
        str = String(zeroRemovedString.count, radix: 2)

    }

    return result
}
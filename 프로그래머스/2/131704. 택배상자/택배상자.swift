import Foundation

func solution(_ order:[Int]) -> Int {
    var parcelStack = [Int]()
    var result = 0
    var headOfBelt = 1
    
    for o in order {
        while headOfBelt <= o {     // 스택에 쌓기
            parcelStack.append(headOfBelt)
            headOfBelt += 1
        } // 더 이상 벨트에 o 없음 -> 스택에서 찾으러 가기

        // 스택에서 찾기
        if parcelStack[parcelStack.count - 1] == o {
            parcelStack.removeLast()
            result += 1
        } else {
            break
        }
    }
    
    return result
}
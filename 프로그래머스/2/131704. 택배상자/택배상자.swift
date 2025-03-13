import Foundation

// 기사님한테 넘겨 줄 물건도 스택에 쌓기: parcel <= o
// 그러면 스택만 봐도 됨.
// 스택의 탑과 o가 다르면 그냥 끗
func solution(_ order:[Int]) -> Int {
    var stack = [Int]()
    var parcel = 1
    var result = 0
    
    for o in order {
        while parcel <= o {
            stack.append(parcel)
            parcel += 1
        }
        
        if stack.last! == o {
            stack.removeLast()
            result += 1
        } else {
            break
        }
    }
    
    return result
}
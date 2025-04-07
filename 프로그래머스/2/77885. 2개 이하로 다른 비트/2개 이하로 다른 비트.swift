import Foundation
/**
2개 이하로 작은 비트를 찾아야 됨 -> 찾지 말고 해당 숫자에서 두개 이하로 바꾸기
어떻게 해야 가장 작을까? -> 이진수 짝수는 1의 자리가 무조건 0이므로, +1이 답.
1 -> 0: 작아짐, 0 -> 1: 커짐 
=> 큰 자릿수부터 쭉 스캔 -> 가장 작은 자릿수의 0을 1로 바꾸면 됨
-> 2개까진 달라도 되니, 그다음 자릿수를 그냥 0으로 바꿔버리면 더 작아짐.
-> if let  = lastIndex(of: "0") 이용해서 찾기
-> if let =  lastIndex를 이용한다면 swapAt( , ) 이용하면 코드 깔끔해짐.
-> 이진수 홀수는 1의 자리가 무조건 1이니깐 보장됨.
*/
func solution(_ numbers:[Int64]) -> [Int64] {
    return numbers.map { getNextNum($0) }
}

func getNextNum(_ num: Int64) -> Int64 {
    if num % 2 == 0 {
        return num + 1
    } else {
        var binaryNum = Array(String(num, radix: 2))
        
        if let lastZeroIdx = binaryNum.lastIndex(of: "0") {
            binaryNum.swapAt(lastZeroIdx, lastZeroIdx + 1)
        } else {
            binaryNum.insert("0", at: 1)
        }
        return Int64(String(binaryNum), radix: 2)!
    }
}
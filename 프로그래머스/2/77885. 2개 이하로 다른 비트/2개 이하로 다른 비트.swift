import Foundation
// f(x): x보다 크고 x와의 비트가 1개 혹은 2개 다른 수 중 최소
// 비트의 위치까지 봐야됨.
func solution(_ numbers:[Int64]) -> [Int64] {
    return numbers.map { getFx($0)}
}

func getFx(_ num: Int64) -> Int64 {
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
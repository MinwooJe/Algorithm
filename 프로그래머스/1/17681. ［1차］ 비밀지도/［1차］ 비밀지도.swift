import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    let entireMap = (0..<n)
        .map { arr1[$0] | arr2[$0] }
        .map {
            String($0, radix: 2)
                .replacingOccurrences(of: "0", with: " ")
                .replacingOccurrences(of: "1", with: "#")
        }
    
    
    let paddedMap = entireMap.map { String(repeating: " ", count: n - $0.count) + $0 }
    
    return paddedMap
}
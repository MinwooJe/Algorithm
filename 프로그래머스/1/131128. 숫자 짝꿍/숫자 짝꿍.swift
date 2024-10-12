import Foundation

func solution(_ X:String, _ Y:String) -> String {
    var xHash = [Character: Int]()
    var yHash = [Character: Int]()
    var pairHash = [Character: Int]()
    var result = ""
    
    for x in X {
        xHash[x, default: 0] += 1
    }
    for y in Y {
        yHash[y, default: 0] += 1
    }
    
    for x in xHash.keys {
        guard let yCount = yHash[x] else { continue }
        pairHash[x] = min(xHash[x]!, yCount)
    }
    
    // 숫자 문자열을 배열로 대체하여 역순으로 처리
    for k in (0...9).reversed() {
        if let count = pairHash[Character(String(k))] {
            result += String(repeating: String(k), count: count)
        }
    }
    
    if result.isEmpty {
        return "-1"
    }
    
    if result.allSatisfy({ $0 == "0" }) {
        return "0"
    }
    
    return result
}

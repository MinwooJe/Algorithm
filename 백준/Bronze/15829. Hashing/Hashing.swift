import Foundation
let n = Int(readLine()!)!
let str = readLine()!
// a - 97

func hash(_ n: Int, _ str: String) -> Int {
    var result = 0
    for (i, s) in str.enumerated() {
        let a = Int(s.asciiValue!) - 96
        result += a * Int(pow(31, Double(i)))
    }
    
    return result % 1234567891
}

print(hash(n, str))

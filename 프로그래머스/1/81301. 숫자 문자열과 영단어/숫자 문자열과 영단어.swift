import Foundation

func solution(_ s:String) -> Int {
    var s = s
    let numDict = [0: "zero", 1: "one", 2: "two", 3: "three", 4: "four",
                   5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine"]
    
    for i in 0..<numDict.count {
        s = s.replacingOccurrences(of: numDict[i, default: ""], with: String(i))
    }
    
    guard let result = Int(s) else { return 0 }

    return result
}
import Foundation

func solution(_ s:String) -> Int {
    let numDict = [0: "zero", 1: "one", 2: "two", 3: "three", 4: "four",
                   5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine"]
    var s = s
    for i in 0..<10 {
        s = s.replacingOccurrences(of: numDict[i]!, with: String(i))    
    }
    
    return Int(s)!
}
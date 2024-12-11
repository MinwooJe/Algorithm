import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    let alphabetIdxDict = Dictionary(uniqueKeysWithValues: zip(alphabet, (0...25)))
    var result = ""
    print(alphabet.count)
    
    for c in s {
        var currIdx = alphabetIdxDict[c]!
        var count = 0
        
        while count < index {
            currIdx += 1
            if currIdx == 26 {
                currIdx = 0
            }
            if !skip.contains(alphabet[currIdx]) {
                count += 1
            }
        }
        
        result += String(alphabet[currIdx])
    }
    
    return result
}
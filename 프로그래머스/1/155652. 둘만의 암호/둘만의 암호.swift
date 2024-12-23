import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var skippedArr = Array("abcdefghijklmnopqrstuvwxyz").filter { !skip.contains($0) }
    var result = ""
    
    for c in s {
        let currIdx = skippedArr.firstIndex(of: c)!
        var skippedIdx = (currIdx + index) % skippedArr.count
        result += String(skippedArr[skippedIdx])
    }
    
    return result
}
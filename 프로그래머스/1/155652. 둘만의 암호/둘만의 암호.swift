import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let skipped = Array("abcdefghijklmnopqrstuvwxyz").filter { !skip.contains($0) }
    var result = ""
    
    for c in s {
        let idx = skipped.firstIndex(of: c)!
        let newIdx = (idx + index ) % skipped.count
        result += String(skipped[newIdx])
    }
    
    return result
}
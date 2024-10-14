import Foundation

func solution(_ t:String, _ p:String) -> Int {
    let tArray = Array(t)
    var result = 0
    
    for i in 0..<tArray.count - p.count + 1{
        if String(tArray[i...i+p.count-1]) <= p {
            result += 1
        }
    }
    
    return result
}
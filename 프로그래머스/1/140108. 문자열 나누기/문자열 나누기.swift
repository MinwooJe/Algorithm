import Foundation

func solution(_ s:String) -> Int {
    var arr = Array(s).map { String($0) }
    var (same, notSame) = (0, 0)
    var x = ""
    var count = 0
    
    for c in arr {
        if same == notSame {
            count += 1
            (same, notSame) = (0, 0)
            x = c
        }
        
        if x == c {
            same += 1
        } else {
            notSame += 1
        }
    }
    
    return count
}
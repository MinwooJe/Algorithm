import Foundation

func solution(_ s:String) -> Int {
    var arr = Array(s).map { String($0) }
    var result = 0
    var (same, notSame) = (0, 0)
    var x = ""
    // ca bba
    for c in arr {
        if same == notSame {
            result += 1
            same += 1
            x = c
        } else {
            if c == x {
                same += 1
            } else {
                notSame += 1
            }
        }
    }
    
    return result
}
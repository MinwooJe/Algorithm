func solution(_ s:String) -> String {
    var str = s.map { String($0) }
    var result = ""
    var isFirst = true
    
    for s in str {
        if isFirst {
            result += s.uppercased()
            isFirst = false
        } else if !isFirst {
            result += s.lowercased()
        } 
        
        if s == " " {
            isFirst = true
        }
    }
    return result
}
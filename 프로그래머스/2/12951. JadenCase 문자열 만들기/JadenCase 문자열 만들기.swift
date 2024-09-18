func solution(_ s:String) -> String {
    var target: Array = Array(s).map { String($0) }
    var isFirst: Bool = true
    
    for i in 0..<target.count {        
        if isFirst && Character(target[i]).isLetter {
            target[i] = target[i].uppercased()
        } else {
            target[i] = target[i].lowercased()
        }
        
        if target[i] == " " {
            isFirst = true
        } else {
            isFirst = false
        }
    }
    return String(target.joined(separator: ""))
}
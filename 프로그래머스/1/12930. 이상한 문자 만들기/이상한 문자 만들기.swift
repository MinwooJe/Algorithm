func solution(_ s:String) -> String {    
    var wordIndex = 0
    var result = ""
    
    for (index, value) in s.enumerated() {
        if value.isWhitespace {
            wordIndex = 0
            result += String(value)
        } else {
            if wordIndex % 2 == 0 {
                result += value.uppercased()
            } else {
                result += value.lowercased()
            }
            wordIndex += 1
        }
    }
    
    return result
}

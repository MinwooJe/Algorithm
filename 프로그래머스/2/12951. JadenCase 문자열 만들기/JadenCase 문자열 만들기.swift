func solution(_ s:String) -> String {
    var result = ""
    var wordIdx = 0
    for c in s {
        if wordIdx == 0 && c.isLetter {
            result += String(c.uppercased())
        } else if c.isLetter {
            result += String(c.lowercased())
        } else {
            result += String(c)
        }
        
        wordIdx += 1

        if c == " " {
            wordIdx = 0
        }
    }
    
    return result
}
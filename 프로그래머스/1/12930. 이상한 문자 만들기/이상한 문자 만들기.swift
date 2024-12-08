func solution(_ str:String) -> String {
    var wordIdx = 0
    var result = [String]()
    
    for s in str {
        if s == " " {
            wordIdx = 0
            result.append(" ")
            continue
        }
        
        if wordIdx % 2 == 0 {
            result.append(s.uppercased())
        } else {
            result.append(s.lowercased())
        }
        
        wordIdx += 1
    }
    
    return result.joined()
}

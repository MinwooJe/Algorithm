func solution(_ s:String) -> String {
    // 문자열 쫙 돌기
    // 공백 나오면 인덱스 초기화
    var s = Array(s.lowercased()).map { String($0) }
    var wordIndex: Int = 0
    
    for i in 0..<s.count {
        if s[i] == " " {
            wordIndex = 0
        } else {
            if wordIndex % 2 == 0 {
                s[i] = s[i].uppercased()
            }
            
            wordIndex += 1
        }
    }
    
    return s.joined(separator: "")
}

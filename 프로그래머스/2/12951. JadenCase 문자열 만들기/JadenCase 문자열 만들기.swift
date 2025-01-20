func solution(_ s:String) -> String {
    var answer = ""
    var wordIndex = 0

    for c in s {
        let strC = String(c)
        if strC == " " {
            wordIndex = 0
            answer += strC
            continue
        } else if c.isLetter && wordIndex == 0 {
            answer += strC.uppercased()
        } else if c.isLetter {
            answer += strC.lowercased()
        } else {
            answer += strC
        }
        wordIndex += 1
    }

    return answer
}
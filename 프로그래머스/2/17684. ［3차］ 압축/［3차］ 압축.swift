func solution(_ msg:String) -> [Int] {
    var msg = msg.map { String($0) }
    var result = [Int]()
    var dict = [String: Int]()
    
    for (idx, char) in "ABCDEFGHIJKLMNOPQRSTUVWXYZ".enumerated() {
        dict[String(char)] = idx + 1
    }
    
    var currIdx = 0
    var currWord = msg[0]
    while currIdx < msg.count - 1 { // 조건 한 번 확인 필요
        // 한 글자는 무조건 잇음.
        // 사전에 있는지 검사
            // 있으면?: 글자 붙여야 됨. (없을 때 까지)
            // 없으면?: next와 합쳐서 사전에 저장, result에 추가 -> currWord, next 구분 필요
                // currWord 초기화도 필요
        let next = msg[currIdx + 1]
        
        if dict[currWord + next] == nil {
            dict[currWord + next] = dict.count + 1
            result.append(dict[currWord]!)
            currWord = ""
        }

        currWord += next
        currIdx += 1
    }
    
    result.append(dict[currWord, default: 0])
    return result
}
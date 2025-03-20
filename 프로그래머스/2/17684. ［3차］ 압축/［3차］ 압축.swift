func solution(_ msg:String) -> [Int] {
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }
    var dict = Dictionary(uniqueKeysWithValues: zip(alphabet, (1...26)))
    var msg = Array(msg).map { String($0) }
    var result = [Int]()
    
    var cur = msg[0]
    var idx = 1
    while idx < msg.count {
        let next = msg[idx]
        if dict[cur + next] != nil {
            cur += next
        } else {
            result.append(dict[cur]!)
            dict[cur + next] = dict.count + 1
            cur = next
        }
        idx += 1
    }
    
    if dict[cur] != nil {
        result.append(dict[cur]!)
    }
    
    return result
}
// T O B E O R N O T TO BE O R TOB EO RNOT

/**
입력: 대문자 문자열
출력: 압축한 후의 사전 인덱스를 배열로 출력

압축 가정
1. 길이가 1인 모든 단어를 포함하도록 사전 초기화 (A: 1, ..., Z: 26)
2. 사전에서 현재 입력과 일치하는 가장 긴 문자열 `W` 찾기
3. w에 해당하는 사전의 색인 번호 출력, 입력에서 w 제거
4. 입력에서 처리되지 않은 다음 글자가 남아있다면(c), w+c에 해당하는 단어를 사전에 등록
5. 단계 2로 돌아감.
*/
func solution(_ msg:String) -> [Int] {
    let msg = Array(msg)
    var result = [Int]()
    var dict: [String: Int] = [:]
    for (i, char) in "ABCDEFGHIJKLMNOPQRSTUVWXYZ".enumerated() {
        dict[String(char)] = i + 1
    }
    
    var currIdx = 0
    var word = String(msg[currIdx])
    while currIdx < msg.count - 1 {
        let next = String(msg[currIdx + 1])
        
        if !dict.keys.contains(word + next) {
            result.append(dict[word]!)
            dict[word + next] = dict.count + 1
            word = ""
        }
        word += next
        currIdx += 1
    }
    
    result.append(dict[word]!)

    return result
}
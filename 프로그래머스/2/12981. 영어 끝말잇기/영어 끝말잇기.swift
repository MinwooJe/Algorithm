import Foundation
/**
- 중복 단어 x
- 앞 사람의 마지막 글자 == 뒷 사람의 첫 글자

출력: [가장 먼저 탈락하는 사람의 번호, 자신의 몇 번째 차례인지?]
*/
func solution(_ n:Int, _ words:[String]) -> [Int] {
    var visitedWords = Set<String>()
    var result = [0, 0]

    visitedWords.insert(words[0])
    for i in 1..<words.count {
        if words[i - 1].last! != words[i].first! || visitedWords.contains(words[i]) {
            print(words[i], i)
            let player = i % n + 1
            let turn = i / n + 1
            result = [player, turn]
            break
        }
        visitedWords.insert(words[i])
        print(visitedWords)
    }

    return result
}
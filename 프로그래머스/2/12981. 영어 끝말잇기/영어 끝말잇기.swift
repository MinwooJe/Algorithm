import Foundation
/**
1. 앞 사람의 마지막 문자 == 뒷 사람의 마지막 문자
2. 이전에 등장했는지?

가장 먼저 탈락하는 사람의 번호와 그 사람이 자신의 몇 번째 차례에 탈락하는지 구하기

1) 탈락자 찾기
2) 탈락자 번호, 몇 번째 차례에 탈락하는지 찾기
*/
func solution(_ n:Int, _ words:[String]) -> [Int] {
    var visitedWords = Set<String>()
    var answer = [0, 0]
    
    visitedWords.insert(words[0])
    for i in 1..<words.count {
        if words[i - 1].last! != words[i].first!
        || visitedWords.contains(words[i]) {
            let player = i % n + 1
            let turn = i / n + 1
            answer = [player, turn]
            break
        }
        visitedWords.insert(words[i])
    }

    return answer
}
import Foundation

/**
begin을 target으로 바꿀 수 있냐? -> 불가능하면 0, 가능하면 최소 변환 횟수
단어: 알파벳 소문자, 단어 길이 3~10, 모든 단어 길이 같음.
words: 중복 x
begin != target
상태트리 그려보기
*/

/**
0. target이 words 안에 없으면 무조건 못 바꿈. (있어도 못바꿀수도있음)
1. isConvertable: 한 개만 다른지 확인하는 함수
2. 변환 가능한 단어 큐에 집어 넣기
3. visited 배열 필요 hit -> hot -> hit -> ... 방지
*/
func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target) else { return 0 }
    
    var visited = [String: Bool]()
    var result = Int.max
    for word in words {
        visited[word] = false
    }
    
    func dfs(_ count: Int, _ curr: String, _ visited: [String: Bool]) -> Int {
        if curr == target {
            return count
        }

        var visited = visited
        let targets = words.filter { !visited[$0]! && isConvertable(curr, $0) }
        // print(">>>", curr, targets)
        targets.forEach { 
            visited[$0] = true
            let ret = min(result, dfs(count + 1, $0, visited))
            if result != 0 && ret == 0 { 
                 
            } else {
                result = ret
            }
            
            visited[$0] = false
        }
        
        return 0
    }
    
    dfs(0, begin, visited)
    
    return result
}

func isConvertable(_ word: String, _ target: String) -> Bool {
    let (word, target) = (Array(word), Array(target))
    var diffCount = 0
    
    for (w, t) in zip(word, target) {
        diffCount += w != t ? 1 : 0
    }
    
    return diffCount == 1 ? true : false
}
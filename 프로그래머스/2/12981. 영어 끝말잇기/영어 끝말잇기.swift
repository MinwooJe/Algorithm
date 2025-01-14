import Foundation

var wordDictionary = [String: Bool]()
func solution(_ n:Int, _ words:[String]) -> [Int] {
    wordDictionary[words[0]] = true

    for idx in 1..<words.count {
        if isDuplicated(words[idx]) || !isValid(words[idx - 1], words[idx]) {
            let player = idx % n + 1
            let round = idx / n + 1
            return [player, round]
        }
        wordDictionary[words[idx]] = true
    }

    return [0, 0]
}

func isDuplicated(_ word: String) -> Bool {
    return wordDictionary[word] != nil
}

func isValid(_ prev: String, _ curr: String) -> Bool {
    return prev.last == curr.first
}
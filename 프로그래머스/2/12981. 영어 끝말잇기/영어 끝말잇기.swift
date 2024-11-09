import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    let index = getFailIndex(n, words)
    if index == 0 {
        return [0, 0]
    } else {
        return [index % n + 1, index / n + 1]
    }
}

func getFailIndex(_ n: Int, _ words: [String]) -> Int {
    let wordsCount = words.count
    var appearedWordHash = [words[0]: 1]
    
    for i in 0..<wordsCount - 1 {
        appearedWordHash[words[i + 1], default: 0] += 1
        
        if appearedWordHash[words[i + 1]]! >  1 {
            return i + 1
        }
        
        if let frontWordsLast = words[i].last,
           let backWordsFirst = words[i + 1].first,
           frontWordsLast != backWordsFirst {
               return i + 1
        }
    }
    return 0
}
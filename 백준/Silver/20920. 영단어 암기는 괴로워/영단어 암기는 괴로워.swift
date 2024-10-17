let components = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (components[0],components[1])
var wordAppearCount = [String: Int]()


for _ in 0..<n {
    let word = readLine()!
    guard word.count >= m else { continue }
    
    wordAppearCount[word, default: 0] += 1
}

let result = wordAppearCount
    .sorted { $0.key < $1.key}
    .sorted { $0.key.count > $1.key.count }
    .sorted { $0.value > $1.value }
    .map { $0.key }

result.forEach { print($0) }

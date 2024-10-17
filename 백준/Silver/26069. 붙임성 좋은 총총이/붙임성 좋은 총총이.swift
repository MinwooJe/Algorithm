let n = Int(readLine()!)!
let chong = "ChongChong"
var isRainbow: [String: Bool] = [chong: true]
var count = 0

for _ in 0..<n {
    let components = readLine()!.split(separator: " ").map { String($0) }
    let (a, b) = (components[0],components[1])
    
    if a == chong || isRainbow[a, default: false] == true {
        isRainbow[b] = true
    } else if b == chong || isRainbow[b, default: false] == true {
        isRainbow[a] = true
    }
}

print(isRainbow.filter { $0.value == true}.count)

var table = Array(repeating: 0, count: 101)
let match_min = [0, 0, 1, 7, 4, 2, 0, 8]

for i in 2...7 {
    table[i] = match_min[i]
}
table[6] = 6
table[8] = 10

for i in 9..<101 {
    table[i] = table[i - 2] * 10 + match_min[2]
    for j in 3...7 {
        let tablei = table[i]
        let candidate = table[i - j] * 10 + match_min[j]
        table[i] = min(table[i], table[i - j] * 10 + match_min[j])
    }
}

func getMax(_ num: Int) -> String {
    if num % 2 == 0 {
        let a = String(repeating: "1", count: 50)
        return String(repeating: "1", count: num / 2)
    } else {
        return "7" + String(repeating: "1", count: (num - 3) / 2)
    }
}

let inputCount = Int(readLine()!)!
for _ in 0..<inputCount {
    let num = Int(readLine()!)!
    print(table[num], getMax(num))
}

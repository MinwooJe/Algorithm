let input = readLine()!.split(separator: " ").map { Int($0)! }
let cards = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var sums = [Int]()

func blackJack() -> Int {
    outer: for i in 0..<n {
        middle: for j in (i + 1)..<n {
            inner: for k in (j + 1)..<n {
                let sum = cards[i] + cards[j] + cards[k]
                if sum == m {
                    return sum
                } else if sum <= m {
                    sums.append(sum)
                }
            }
        }
    }
    return sums.max()!
}

print(blackJack())


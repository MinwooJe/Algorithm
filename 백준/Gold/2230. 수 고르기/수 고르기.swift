// n: 배열 개수, m: 차이가 m 이상이면서 제일 작은수
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var arr = [Int]()

for _ in 0..<n {
    let input = Int(readLine()!)!
    arr.append(input)
}

arr = arr.sorted()

var (l, r) = (0, 0)
var result = Int.max

while l < arr.count && r < arr.count && l <= r {
    let diff = arr[r] - arr[l]
    
    if diff >= m {
        result = min(diff, result)
        l += 1
    } else {
        r += 1
    }
}

print(result)
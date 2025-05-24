/**
 가정: 배열이 오름차순으로 정렬됨.
 1. i가 증가함에 따라 a[j] - a[i]가 m 이상이 되는 최초의 지점 j 또한 증가.
 2. 각 i에 대해 a[j] - a[i]가 m 이상이 되는 최초의 지점 j를 찾은 이후에는 a[j + 1], a[j + 2], ... 를 확인할 필요가 없음.
 이중 for문 완탐과 비교해서, 각 i에 대한 모든 j를 보지않고, 이전의 j값을 참고해서 최적화.
 시간 복잡도: l, r이 배열을 한 번 순회 -> O(n)
 */
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var arr = [Int]()
var result = Int.max

for _ in 0..<n {
    let input = Int(readLine()!)!
    arr.append(input)
}

arr.sort()

var (l, r) = (0, 0)
while r < arr.count && l < arr.count {
    let diff = arr[r] - arr[l]
    
    if diff >= m {
        l += 1
        result = min(result, diff)
    } else {
        r += 1
    }
}

print(result)

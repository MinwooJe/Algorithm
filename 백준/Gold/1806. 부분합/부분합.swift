/**
 수열이므로 정렬할 수 없음.
 그러나 l부터 r까지의 합이 target을 넘어버린다면 이후에는 볼 필요 없음.
 주의: 수열의 원소가 target보다 클 수도 있음.
 */
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (count, target) = (input[0], input[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var result = Int.max
var r = 0
var sum = arr[0]

for l in 0..<count {
    while sum < target && r < count - 1 {
        r += 1
        sum += arr[r]
    }
    
    if sum >= target {
        result = min(result, r - l + 1)
    }
    sum -= arr[l]
}

if result == Int.max {
    result = 0
}
print(result)

func solution(_ arr: [Int]) -> Int {
    var memo = [Int: Int]()
    
    func dp(_ n: Int) -> Int {
        if n == 1 {
            return arr[1]
        } else if n == 2 {
            return arr[1] + arr[2]
        } else if n == 3 {
            return max(arr[1], arr[2]) + arr[3]
        } else if !memo.keys.contains(n) {
            memo[n] = max(dp(n - 3) + arr[n - 1], dp(n - 2)) + arr[n]
        }
        
        return memo[n]!
    }
    
    return dp(arr.count - 1)
}

let n = Int(readLine()!)!
var arr = [0]

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

print(solution(arr))

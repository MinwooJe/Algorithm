let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, target) = (input[0], input[1])
let nums = readLine()!.split(separator: " ").map { Int($0)! }

func solution(nums: [Int]) -> Int {
    var result = 0
    
    func bruteforce(_ start: Int, _ curr: [Int]) {
        if !curr.isEmpty && curr.reduce(0, +) == target {
            result += 1
        }
        
        var curr = curr
        for i in start..<n {
            curr.append(nums[i])
            bruteforce(i + 1, curr)
            curr.removeLast()
        }
    }

    bruteforce(0, [])
    return result
}

print(solution(nums: nums))

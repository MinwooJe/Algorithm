// n개의 수 중에서, 길이가 m인 중복 비내림차순 수열 만들기

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

func getSequence(_ m: Int, _ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    
    func bruteforce(_ start: Int, _ curr: [Int]) {
        if curr.count == m {
            result.append(curr)
            return
        }
        
        var curr = curr
        for i in start..<n {
            curr.append(nums[i])
            bruteforce(i, curr)
            curr.removeLast()
        }
    }
    
    bruteforce(0, [])
    return result
}

let result = getSequence(m, nums)

result.forEach { r in
    r.forEach { print($0, terminator: " ")}
    print()
}

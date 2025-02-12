while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    guard input != [0] else { break }
    let (k, set) = (input[0], Array(input[1..<input.count]))
    let result = subset(k, set)
    print(parseToString(from: result))
    print()
}

func subset(_ k: Int, _ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    
    func bruteforce(_ start: Int, _ curr: [Int]) {
        if curr.count == 6 {
            result.append(curr)
            return
        }
        
        var curr = curr
        for i in start..<k {
            curr.append(nums[i])
            bruteforce(i + 1, curr)
            curr.removeLast()
        }
    }
    
    bruteforce(0, [])
    return result
}

func parseToString(from arr: [[Int]]) -> String {
    return arr.map { $0.map { String($0) }.joined(separator: " ") }.joined(separator: "\n")
}

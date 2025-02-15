while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    guard input != [0] else { break }
    let (k, nums) = (input[0], Array(input[1..<input.count]))
    combination(nums, k)
    print()
}

func combination(_ nums: [Int], _ k: Int) {
    func bruteforce(_ start: Int, _ curr: [Int]) {
        if curr.count == 6 {
            print(curr.map { String($0) }.joined(separator: " "))
            return
        }
        
        for i in start..<nums.count {
            bruteforce(i + 1, curr + [nums[i]])
        }
    }
    
    bruteforce(0, [])
}
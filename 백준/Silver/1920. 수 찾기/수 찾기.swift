/**
 첫 째줄: 요 안에 있나?
 셋 째줄: 내가 찾아야 할 것들
 */

let numCount = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let targetCount = Int(readLine()!)!
var targets = readLine()!.split(separator: " ").map { Int($0)! }

func binarySearch(_ target: Int, _ nums: [Int]) -> Bool {
    var (l, r) = (0, nums.count - 1)
    var result = false
    
    while l <= r {
        let mid = (l + r) / 2
        if target > nums[mid] {
            l = mid + 1
        } else if target < nums[mid] {
            r = mid - 1
        } else {
            result = true
            break
        }
    }
    
    return result
}

targets.forEach {
    binarySearch($0, nums) ? print("1") : print("0")
}

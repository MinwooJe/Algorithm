import Foundation
/**
 중복 조합 구하기
 조합의 각 원소의 크기는 m
 비내림차순 = 크거나 같다
 출력 형식은 한 줄에 하나씩
 */
let input = readLine()!.split(separator: " ").map { Int($0)! }
let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let (n, m) = (input[0], input[1])

func combination(_ nums: [Int], _ count: Int) {
    func bruteforce(_ start: Int, _ curr: [Int]) {
        if curr.count == count {
            print(curr.map { String($0) }.joined(separator: " "))
            return
        }
        
        for i in start..<n {
            bruteforce(i, curr + [nums[i]])
        }
    }
    
    bruteforce(0, [])

}

combination(nums, m)

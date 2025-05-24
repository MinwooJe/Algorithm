import Foundation

// 소수 중 연속.
let target = Int(readLine()!)!
var primes = getPrimes(target)
var r = 0
var result = 0

if !primes.isEmpty {
    var sum = primes[0]
    
    for l in 0..<primes.count {
        while sum < target && r < primes.count - 1 {
            r += 1
            sum += primes[r]
        }
        
        if sum == target {
            result += 1
        }
        
        sum -= primes[l]
    }
}
print(result)

// target 이하의 소수 만들기
func getPrimes(_ target: Int) -> [Int] {
    let end = Int(sqrt(Double(target)))
    var nums = Array(repeating: true, count: target + 1)
    
    for i in 2..<end + 1 {
        guard nums[i] else { continue }
        for j in stride(from: i + i, to: target + 1, by: i) {
            nums[j] = false
        }
    }
    
    var result = [Int]()
    for (idx, value) in nums.enumerated() {
        if value && idx >= 2 {
            result.append(idx)
        }
    }
    
    return result
}


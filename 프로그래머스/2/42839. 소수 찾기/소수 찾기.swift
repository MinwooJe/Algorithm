import Foundation

func solution(_ numbers:String) -> Int {
    let numbers = Array(numbers)
    var result = Set<Int>()
    
    func bruteforce(_ curr: [Int]) {
        var num = ""
        for i in 0..<curr.count {
            num += String(numbers[curr[i]])
        }
        
        if num != "" && isPrime(Int(num)!) {
            result.insert(Int(num)!)
        }
        
        for i in 0..<numbers.count {
            if !curr.contains(i) {
                bruteforce(curr + [i])
            }
        }
    }

    bruteforce([])

    return result.count
}

func isPrime(_ num: Int) -> Bool {
    guard num > 1 else { return false }

    let end = Int(sqrt(Double(num))) + 1
    
    for i in 2..<end {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}
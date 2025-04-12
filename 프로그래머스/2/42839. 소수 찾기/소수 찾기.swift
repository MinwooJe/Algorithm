import Foundation

func solution(_ numbers:String) -> Int {
    var numbers = Array(numbers)
    var result = Set<Int>()

    func bruteforce(_ curr: [Int]) {
        var num = ""
        for i in curr {
            num += String(numbers[i])
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
    guard num >= 2 else { return false }

    let end = Int(sqrt(Double(num))) + 1
    
    for i in 2..<end {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}
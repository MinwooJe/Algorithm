import Foundation

let inputCount = Int(readLine()!)!

for _ in 0..<inputCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (h, w, n) = (input[0], input[1], input[2])
    
    if n <= h {
        print("\(n)01")
    } else {
        let floor = n % h == 0 ? h : n % h
        let roomNum = n % h == 0 ? n / h : n / h + 1
        let result = String(floor) + String(format: "%02d", roomNum)
        print(result)
    }
}


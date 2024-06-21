func solution(_ n:Int) -> Int {
    guard n > 0 else {
        return 0
    }
    
    var answer = 0
    let end = Int(Double(n).squareRoot())
    
    for i in 1...end {
        if n % i == 0 {
            answer += i
            print(i)
            if i * i != n {
                answer += n / i
            }
        }
    }
    
    return answer
}
func solution(_ n:Int64) -> [Int] {
    
    var num: Int = Int(n)
    var answer: [Int] = []
    
    while num > 0 {
        answer.append(num % 10)
        num /= 10
    }
    
    return answer
}

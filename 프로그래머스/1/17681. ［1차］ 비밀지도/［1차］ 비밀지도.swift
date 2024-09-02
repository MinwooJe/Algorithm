func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for (a1, a2) in zip(arr1, arr2) {
        let overlapped = String(a1 | a2, radix: 2)   
        let formmated = String(repeating: "0", count: n - overlapped.count) + overlapped

        let crypto = formmated
        .replacingOccurrences(of: "0", with: " ")
        .replacingOccurrences(of: "1", with: "#")
        
        answer.append(crypto)
    }

    return answer
}
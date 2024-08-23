func recursion(s: [String], l: Int, r: Int, callCount: inout Int) -> Int {
    callCount += 1
    if l >= r {
        return 1
    } else if s[l] != s[r] {
        return 0
    } else {
        return recursion(s: s, l: l + 1, r: r - 1, callCount: &callCount)
    }
}

func isPalindrom(s: [String]) -> (Int, Int) {
    var callCount = 0
    return (recursion(s: s, l: 0, r: s.count - 1, callCount: &callCount), callCount)
}

let count = Int(readLine()!)!

for _ in 0..<count {
    let inputString = readLine()!.map { String($0) }
    let (isPalindrom, callCount) = isPalindrom(s: inputString)
    print(String(isPalindrom) + " " + String(callCount))
}
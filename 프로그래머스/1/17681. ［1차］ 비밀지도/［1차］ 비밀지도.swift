func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return (0..<n).map {
        let overlapped = String(arr1[$0] | arr2[$0], radix: 2)
        let padded = String(repeating: "0", count: n - overlapped.count) + overlapped
        return padded.reduce("") { $0 + ($1 == "0" ? " " : "#")}
    }
}


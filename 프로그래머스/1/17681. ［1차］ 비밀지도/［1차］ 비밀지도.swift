func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return (0..<n).map {
        let entireMap = String(arr1[$0] | arr2[$0], radix: 2)
        let paddedMap = String(repeating: "0", count: n - entireMap.count) + entireMap
        return paddedMap.reduce("") { $0 + ($1 == "0" ? " " : "#")}
    }
}


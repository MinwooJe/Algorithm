func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return (0..<n).map {
        let entireRow = String(arr1[$0] | arr2[$0], radix: 2)
        let paddedRow = String(repeating: "0", count: n - entireRow.count) + entireRow
        return paddedRow.reduce("") { $0 + ($1 == "0" ? " " : "#")}
    }
}

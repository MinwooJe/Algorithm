func solution(_ n:Int64) -> [Int] {
    var num: Int = Int(n)
    var arr: [Int] = []

    while num > 0 {
        arr.append(num % 10)
        num /= 10
    }
    return arr
}
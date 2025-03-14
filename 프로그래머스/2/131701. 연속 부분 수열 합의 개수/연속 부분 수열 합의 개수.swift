func solution(_ elements:[Int]) -> Int {
    let seq = elements + elements
    var sum = Set<Int>()

    for i in 0..<elements.count {
        var tempSum = 0
        for j in i..<i + elements.count {
            tempSum += seq[j]
            sum.insert(tempSum)
        }
    }
    
    return sum.count
}
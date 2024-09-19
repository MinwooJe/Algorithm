func solution(_ dartResult:String) -> Int {
    var points = [Int]()
    let dartResult = dartResult.replacingOccurrences(of: "10", with: "x")
    for c in dartResult {
        if c.isNumber || c == "x" {
            if c == "x" {
                points.append(10)
                continue
            }
            points.append(Int(String(c))!)
            continue
        }
        
        let lastIndex = points.count - 1
        if c == "S" {
            continue
        }
        if c == "D" {
            points[lastIndex] = points[lastIndex] * points[lastIndex]
            continue
        }
        if c == "T" {
            points[lastIndex] = points[lastIndex] * points[lastIndex] * points[lastIndex]
            continue
        }
        
        if c == "*" {
            points[lastIndex] = points[lastIndex] * 2
            if lastIndex - 1 >= 0 {
                points[lastIndex - 1] = points[lastIndex - 1] * 2
            }
        }
        if c == "#" {
            points[lastIndex] = points[lastIndex] * -1      
        }
        
    }
    print(points)
    return points.reduce(0, +)
}
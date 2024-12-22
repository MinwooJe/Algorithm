func solution(_ s:String) -> String {
    var arr = Array(s).map { String($0) }
    var currIdx = 0
    
    for i in 0..<s.count {
        if arr[i] == " " {
            currIdx = 0
            continue
        }
        
        if currIdx % 2 == 0 {
            arr[i] = arr[i].uppercased()
        } else {
            arr[i] = arr[i].lowercased()
        }
        currIdx += 1
    }
    
    return arr.joined(separator: "")
}
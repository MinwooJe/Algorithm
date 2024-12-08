func solution(_ s:String) -> Bool {
    return (s.count == 6 || s.count == 4) && s.allSatisfy { $0.isNumber }
}
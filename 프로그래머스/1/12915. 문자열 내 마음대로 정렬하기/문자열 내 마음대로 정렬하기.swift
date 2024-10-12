func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings
        .sorted { $0 < $1 }
        .sorted { Array($0)[n] < Array($1)[n] }
        .map { String($0) }
}

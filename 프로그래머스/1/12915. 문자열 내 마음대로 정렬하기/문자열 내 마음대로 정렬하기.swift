func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings
    .sorted()
    .sorted {
        Array($0)[n] < Array($1)[n]
    }
}
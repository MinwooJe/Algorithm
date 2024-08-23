func factorial(_ n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    
    return n * factorial(n - 1)
}

if let input = readLine(),
   let n = Int(input) {
    print(factorial(n))
}

func recursionFib(_ n: Int) -> Int {
    guard n != 1 && n != 2 else {
        return 1
    }
    return recursionFib(n - 1) + recursionFib(n - 2)
}

func main() {
    let n = Int(readLine()!)!

    print(recursionFib(n), n - 2)
}

main()

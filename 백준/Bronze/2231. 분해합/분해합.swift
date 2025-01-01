let target = Int(readLine()!)!
var generator = target
var generators = [Int]()

while generator != 0 {
    generator -= 1
    let arr = String(generator).compactMap { $0.wholeNumberValue }
    let decomposition = generator + arr.reduce(0, +)
    
    if decomposition == target {
        generators.append(generator)
    }
}

print(generators.min() ?? 0)

let target = Int(readLine()!)!
var i = 1
var decomposition = 0
var generator = target
var generators = [Int]()

while generator != 0 {
    generator -= 1
    let arr = String(generator).compactMap { $0.wholeNumberValue }
    decomposition = generator + arr.reduce(0, +)
    
    if decomposition == target {
        generators.append(generator)
    }
}

print(generators.min() ?? 0)

import Foundation

func solution(_ elements:[Int]) -> Int {
    let doubled = elements + elements
    var visited = Set<Int>()
    
    for base in 1...elements.count {
        var sum = 0
        for i in base..<base + elements.count {
            sum += doubled[i]
            visited.insert(sum)
        }
    }

    return visited.count
}
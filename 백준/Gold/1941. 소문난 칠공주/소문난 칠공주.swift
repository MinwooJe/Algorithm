/**
 let result = combination
 .filter { member in
    memeber.filter { classMap[$0.0][$0.1] == "S"} .count >= 4
 }
 .filter { memeber in
    isConnection(memeber)
 }
 .count
 */


var classMap = [[String]]()
for _ in 0..<5 {
    let input = readLine()!.map { String($0) }
    classMap.append(input)
}

func combination() -> [[(Int, Int)]]{
    var result = [[(Int, Int)]]()
    
    func bruteforce(_ start: Int, _ curr: [(Int, Int)]) {
        if curr.count == 7 {
            result.append(curr)
            return
        }

        for i in start..<25 {
            bruteforce(i + 1, curr + [(i / 5, i % 5)])
        }
    }
    
    bruteforce(0, [])
    return result
}

func isConnection(_ member: [(Int, Int)]) -> Bool {
    var visited = [(Int, Int)]()
    var queue = [(Int, Int)]()
    let delta = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    queue.append(member[0])
    
    while !queue.isEmpty {
        let (currRow, currCol) = queue.removeFirst()
        
        for (dRow, dCol) in delta {
            let nextRow = currRow + dRow
            let nextCol = currCol + dCol
            
            if !visited.contains(where: { $0 == (nextRow, nextCol) })
                && member.contains(where: { $0 == (nextRow, nextCol) }) {
                queue.append((nextRow, nextCol))
                visited.append((nextRow, nextCol))
            }
        }
    }
    
    return visited.count == 7
}

func isValidCount(_ member: [(Int, Int)]) -> Bool {
    return member.filter { classMap[$0.0][$0.1] == "S" }.count >= 4
}

let result = combination()
    .filter { isValidCount($0) && isConnection($0) }.count

print(result)

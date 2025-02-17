import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let park = park.map { Array($0) }
    var location = findStartIndex(park)
    let move = ["N": (-1, 0) , "W": (0, -1), "S": (1, 0), "E": (0, 1)]
    
    for route in routes {
        let (direction, count) = parse(route)
        var isSuccess = true
        var (nextRow, nextCol) = (location.0, location.1)

        for _ in 0..<count {
            nextRow += move[direction]!.0
            nextCol += move[direction]!.1

            guard nextRow >= 0 && nextRow < park.count && nextCol >= 0 && nextCol < park[0].count
                    && park[nextRow][nextCol] != "X" else {
                isSuccess = false
                break
            }
        }

        if isSuccess {
            location = (nextRow, nextCol)
        }
    }

    return [location.0, location.1]
}

func findStartIndex(_ park: [[Character]]) -> (Int, Int) {
    for i in 0..<park.count {
        for j in 0..<park[0].count {
            if park[i][j] == "S" {
                return (i, j)
            }
        }
    }
    return (0, 0)
}

func parse(_ command: String) -> (String, Int) {
    let components = command.split(separator: " ")
    return (String(components[0]), Int(components[1])!)
}

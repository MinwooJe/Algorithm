import Foundation

let directionCoordinateDict = ["N": (-1, 0), "S": (1, 0), "W": (0, -1), "E": (0, 1)]

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let park = park.map { Array($0) }
    var (currRow, currCol) = initCurrLocation(park)

    for route in routes {
        (currRow, currCol) = move(park, route, currRow, currCol)
    }
    
    return [currRow, currCol]
}

func initCurrLocation(_ park: [[Character]]) -> (Int, Int) {
    for row in 0..<park.count {
        for col in 0..<park[0].count {
            if park[row][col] == "S" {
                return  (row, col)
            }
        }
    }
    return (0, 0)
}

func move(_ park: [[Character]], _ route: String, _ currRow: Int, _ currCol: Int) -> (Int, Int) {
    let (direction, count) = parseRoute(route)
    let (dRow, dCol) = directionCoordinateDict[direction, default: (0, 0)]
    var (tempRow, tempCol) = (currRow, currCol)
    
    for _ in 0..<count {
        let (nextRow, nextCol) = (tempRow + dRow, tempCol + dCol)
        guard validateMove(park, nextRow, nextCol) else { return (currRow, currCol) }
        (tempRow, tempCol) = (nextRow, nextCol)
    }
    
    return (tempRow, tempCol)
}

func validateMove(_ park: [[Character]], _ currRow: Int, _ currCol: Int) -> Bool {
    return currRow >= 0 && currCol >= 0 && currRow < park.count && currCol < park[0].count
    && park[currRow][currCol] != "X"
}

func parseRoute(_ route: String) -> (String, Int) {
    let components = route.split(separator: " ").map { String($0) }
    return (components[0], Int(components[1])!)
}

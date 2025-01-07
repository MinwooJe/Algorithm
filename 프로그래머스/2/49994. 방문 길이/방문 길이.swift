import Foundation

struct Path: Equatable {
    let currX: Int
    let currY: Int
    let nextX: Int
    let nextY: Int
}

func solution(_ dirs:String) -> Int {
    var paths = [Path]()
    var (currX, currY) = (0, 0)
    
    for dir in dirs {
        var (nextX, nextY) = (0, 0)
        if dir == "U" {
            (nextX, nextY) = (currX, currY + 1)
        } else if dir == "D" {
            (nextX, nextY) = (currX, currY - 1)
        } else if dir == "L" {
            (nextX, nextY) = (currX - 1, currY)
        } else if dir == "R" {
            (nextX, nextY) = (currX + 1, currY)
        }
        
        if nextX > 5 || nextX < -5 || nextY > 5 || nextY < -5 {
            continue
        }

        let path = Path(currX: currX, currY: currY, nextX: nextX, nextY: nextY)
        let reversePath = Path(currX: nextX, currY: nextY, nextX: currX, nextY: currY)
        if !paths.contains(path) && !paths.contains(reversePath) {
            paths.append(path)
        }
        
        (currX, currY) = (nextX, nextY)
    }

    return paths.count
}
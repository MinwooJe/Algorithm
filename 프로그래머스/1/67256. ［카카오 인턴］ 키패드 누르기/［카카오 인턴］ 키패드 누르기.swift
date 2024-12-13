import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    let hand = hand == "right" ? "R" : "L"
    var left = (3, 0)
    var right = (3, 2)
    
    for num in numbers {
        let targetCoordinate = getCoordinate(num)
        
        if [1, 4, 7].contains(num) {
            result += "L"
        } else if [3, 6, 9].contains(num) {
            result += "R"
        } else {
            let leftDistance = getDistance(left, targetCoordinate)
            let rightDistance = getDistance(right, targetCoordinate)
            
            if leftDistance > rightDistance {
                result += "R"
            } else if leftDistance < rightDistance {
                result += "L"
            } else {
                result += hand
            }
        }
        
        if let lastResult = result.last {
            if lastResult == "R" {
                right = targetCoordinate
            } else {
                left = targetCoordinate
            }
        }
    }
    return result
}

func getCoordinate(_ num: Int) -> (Int, Int) {
    let coordinateDict = [
        1: (0, 0), 2: (0, 1), 3: (0, 2),
        4: (1, 0), 5: (1, 1), 6: (1, 2),
        7: (2, 0), 8: (2, 1), 9: (2, 2),
        0: (3, 1)
    ]
    
    return coordinateDict[num]!
}
func getDistance(_ coordinate: (Int, Int), _ target: (Int, Int)) -> Int {
    return abs(coordinate.0 - target.0) + abs(coordinate.1 - target.1)
}